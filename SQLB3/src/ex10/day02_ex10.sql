SELECT person1.name, person2.name, person1.address AS common_address
FROM person AS person1
JOIN person AS person2
    ON person1.address = person2.address AND person1.id > person2.id;