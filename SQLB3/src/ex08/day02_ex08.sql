SELECT p.name
FROM person p
JOIN person_order po
    ON p.id = po.person_id
JOIN menu m
    ON po.menu_id = m.id
WHERE (p.address = 'Moscow'
    OR p.address = 'Samara')
    AND (m.pizza_name = 'mushroom pizza'
    OR m.pizza_name = 'pepperoni pizza')
    AND p.gender = 'male'
ORDER BY name DESC;