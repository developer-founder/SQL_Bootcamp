SELECT
    p.name,
    m.pizza_name,
    z.name
FROM person p
JOIN person_order ON p.id = person_order.person_id
JOIN menu m ON person_order.menu_id = m.id
JOIN pizzeria z ON m.pizzeria_id = z.id
ORDER BY p.name, m.pizza_name, z.name;