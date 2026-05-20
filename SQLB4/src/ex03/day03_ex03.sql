SELECT pizzeria_name
FROM (
    (
        SELECT p.name AS pizzeria_name
        FROM pizzeria p
        JOIN person_visits pv
            ON p.id = pv.pizzeria_id
        JOIN person pe
            ON pv.person_id = pe.id
        WHERE pe.gender = 'female'

        EXCEPT ALL

        SELECT p.name AS pizzeria_name
        FROM pizzeria p
        JOIN person_visits pv
            ON p.id = pv.pizzeria_id
        JOIN person pe
            ON pv.person_id = pe.id
        WHERE pe.gender = 'male'
    )

    UNION ALL

    (
        SELECT p.name AS pizzeria_name
        FROM pizzeria p
        JOIN person_visits pv
            ON p.id = pv.pizzeria_id
        JOIN person pe
            ON pv.person_id = pe.id
        WHERE pe.gender = 'male'

        EXCEPT ALL

        SELECT p.name AS pizzeria_name
        FROM pizzeria p
        JOIN person_visits pv
            ON p.id = pv.pizzeria_id
        JOIN person pe
            ON pv.person_id = pe.id
        WHERE pe.gender = 'female'
    )
) t
ORDER BY pizzeria_name;