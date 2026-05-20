INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
        (SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT MIN(m.pizzeria_id)
        FROM menu m
            JOIN pizzeria pz ON m.pizzeria_id = pz.id
        WHERE pz.name != 'Papa Johns' AND m.price < 800),
        '2022-01-08'
       );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats;