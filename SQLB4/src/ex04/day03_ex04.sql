WITH tmp AS (
        SELECT
            pz.name AS pizzeria_name,
            p.gender AS gender
        FROM pizzeria pz
        JOIN menu m ON pz.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
        JOIN person p ON po.person_id = p.id
    )
    (
        SELECT pizzeria_name FROM tmp WHERE gender = 'male'
        EXCEPT
        SELECT pizzeria_name FROM tmp WHERE gender = 'female'
    )
    UNION
    (
        SELECT pizzeria_name FROM tmp WHERE gender = 'female'
        EXCEPT
        SELECT pizzeria_name FROM tmp WHERE gender = 'male'
    )
ORDER BY pizzeria_name;