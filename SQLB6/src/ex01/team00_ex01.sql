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
    WHERE roads.point2 != ALL(tour) AND array_length(TSP.tour, 1) < 4
),
valid_TSP AS (
    SELECT
        TSP.total_cost + roads.cost AS total_cost,
        ARRAY_APPEND(TSP.tour, 'a') AS tour
    FROM TSP
    JOIN roads ON TSP.point2 = roads.point1
        AND roads.point2 = 'a'
    WHERE array_length(TSP.tour, 1) = 4
)

SELECT *
FROM valid_TSP
WHERE total_cost = (SELECT MIN(total_cost) FROM valid_TSP)
   OR total_cost = (SELECT MAX(total_cost) FROM valid_TSP)
ORDER BY total_cost, tour;