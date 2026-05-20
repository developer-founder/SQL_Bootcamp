SELECT
    person.id AS "person.id",
    person.name AS "person.name",
    person.age,
    person.gender,
    person.address,
    pizzeria.id AS "pizzeria.id",
    pizzeria.name AS ".name",
    pizzeria.rating
FROM person
CROSS JOIN pizzeria;