CREATE TABLE IF NOT EXISTS roads (
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
);

INSERT INTO roads (point1, point2, cost)
VALUES ('a', 'b', 10), ('b', 'a', 10),
       ('b', 'c', 35), ('c', 'b', 35),
       ('a','c', 15), ('c', 'a', 15),
       ('a', 'd', 20), ('d','a', 20),
       ('b', 'd', 25), ('d', 'b', 25),
       ('c', 'd', 30), ('d', 'c', 30);

WITH RECURSIVE TSP AS (
    SELECT
        point1,
        point2,
        cost,
        ARRAY[point1, point2] AS tour,
        cost AS total_cost
    FROM roads
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        TSP.point1,
        roads.point2,
        TSP.cost,
        ARRAY_APPEND(TSP.tour, roads.point2) AS tour,
        TSP.total_cost + roads.cost AS total_cost
    FROM TSP
    JOIN roads ON TSP.point2 = roads.point1
    WHERE roads.point2 != ALL(tour)
        AND array_length(TSP.tour, 1) < 4
)

SELECT TSP.total_cost + roads.cost AS total_cost,
       array_append(tour, 'a') AS tour
FROM TSP
JOIN roads ON TSP.point2 = roads.point1
    AND roads.point2 = 'a'
WHERE array_length(tour, 1) = 4
    AND (TSP.total_cost + roads.cost) = (
        SELECT MIN(TSP2.total_cost + roads_back2.cost)
        FROM TSP TSP2
        JOIN roads roads_back2
            ON TSP2.point2 = roads_back2.point1
            AND roads_back2.point2 = 'a'
        WHERE array_length(TSP2.tour, 1) = 4
)
ORDER BY total_cost, tour;

