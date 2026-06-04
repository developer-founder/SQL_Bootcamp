COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок клиентов';
COMMENT ON COLUMN person_discounts.id IS 'PRIMARY KEY';
COMMENT ON COLUMN person_discounts.person_id IS 'ID клиентов';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерий';
COMMENT ON COLUMN person_discounts.discount IS 'Персональная ссылка клиентов';
