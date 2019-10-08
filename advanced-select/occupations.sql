-- Occupations
-- https://www.hackerrank.com/challenges/occupations/problem

SELECT
    [Doctor],
    [Professor],
    [Singer],
    [Actor]
FROM
(SELECT 
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) rn,
         [Name],
         [Occupation] 
     FROM 
         Occupations
    ) as Source

PIVOT
    ( MAX([Name]) FOR [occupation] IN ([Doctor],[Professor],[Singer],[Actor]) ) as pvt
ORDER BY rn
