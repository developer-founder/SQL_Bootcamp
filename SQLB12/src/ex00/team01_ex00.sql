WITH balance_groupped AS (
    SELECT
        user_id,
        type,
        currency_id,
        SUM(money) AS volume
    FROM balance
    GROUP BY
        user_id,
        type,
        currency_id
    ),
last_currency AS (
    SELECT DISTINCT ON (id)
        id,
        name,
        rate_to_usd,
        updated
    FROM currency
    ORDER BY id, updated DESC
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    bg.type,
    bg.volume,
    COALESCE(lc.name, 'not defined') AS currency_name,
    COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
    bg.volume * COALESCE (lc.rate_to_usd, 1) AS total_volume_in_usd
FROM balance_groupped bg
LEFT JOIN public.user u
    ON bg.user_id = u.id
LEFT JOIN last_currency lc
    ON bg.currency_id = lc.id
ORDER BY
    name DESC,
    lastname,
    bg.type;