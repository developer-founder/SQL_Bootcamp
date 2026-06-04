insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    (
        SELECT c.name
        FROM currency c
        WHERE c.id = b.currency_id
        LIMIT 1
    ) AS currency_name,
    COALESCE(
            (
                SELECT c2.rate_to_usd
                FROM currency c2
                WHERE c2.id = b.currency_id
                  AND c2.updated <= b.updated
                ORDER BY c2.updated DESC
                LIMIT 1
            ),
            (
                SELECT c3.rate_to_usd
                FROM currency c3
                WHERE c3.id = b.currency_id
                  AND c3.updated > b.updated
                ORDER BY c3.updated ASC
                LIMIT 1
            )
    ) * b.money AS currency_in_usd
FROM balance b
LEFT JOIN public.user u ON b.user_id = u.id
WHERE b.currency_id IN (SELECT DISTINCT id FROM currency)
ORDER BY name DESC, lastname, currency_name;