SELECT m.pizza_name, m.price, p.name, pv.visit_date
FROM menu m
JOIN pizzeria p
    ON m.pizzeria_id = p.id
JOIN person_visits pv
    ON p.id = pv.pizzeria_id
JOIN person
    ON pv.person_id = person.id
WHERE person.name = 'Kate'
    AND m.price
    BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, p.name;