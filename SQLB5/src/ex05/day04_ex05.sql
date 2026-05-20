CREATE VIEW v_price_with_discount AS
SELECT p.name,
       m.pizza_name,
       m.price,
       ROUND(m.price - m.price * 0.1) AS discount_price
FROM menu m
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
ORDER BY p.name, m.pizza_name;