SELECT * FROM Products;

SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1 CROSS JOIN Products P2;

SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1, Products P2;

