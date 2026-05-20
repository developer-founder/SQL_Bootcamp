SELECT m.pizza_name, m.price, p.name
FROM menu m
LEFT JOIN person_order po
    ON m.id = po.menu_id
JOIN pizzeria p
    ON m.pizzeria_id = p.id
WHERE po.menu_id IS NULL
ORDER BY m.pizza_name, m.price;