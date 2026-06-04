SELECT
    name,
    SUM(total_count) AS total_count
FROM (
    SELECT
        pz.name,
        count(*) AS total_count
    FROM pizzeria pz
    JOIN person_visits pv
        ON pz.id = pv.pizzeria_id
    GROUP BY
        pz.name


    UNION ALL

    SELECT
        pz.name,
        count(*) AS total_count
    FROM pizzeria pz
    JOIN menu m
        ON pz.id = m.pizzeria_id
    JOIN person_order po
        ON m.id = po.menu_id
    GROUP BY
         pz.name
) AS tmp
GROUP BY
name
ORDER BY 2 DESC, name;