
SELECT * FROM us_household_income;
SELECT * FROM ushouseholdincome_statistics;


# Area Land & Area Water by State
SELECT
	State_Name,
    SUM(ALand),
    SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC;

# Mean & Median Income by State
SELECT 
	u.State_Name,
    AVG(s.Mean),
    AVG(s.Median)
FROM us_household_income u
INNER JOIN ushouseholdincome_statistics s ON u.id = s.id
WHERE s.Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC;

# Mean & Median Income by State and City
SELECT 
	u.State_Name,
    u.City,
    AVG(s.Mean),
    AVG(s.Median)
FROM us_household_income u
INNER JOIN ushouseholdincome_statistics s ON u.id = s.id
WHERE s.Mean <> 0
GROUP BY u.State_Name, u.City
ORDER BY 2;

# Mean & Median Income by Type (Village, Town etc.)
SELECT 
	u.Type,
    Count(*),
    AVG(s.Mean),
    AVG(s.Median)
FROM us_household_income u
INNER JOIN ushouseholdincome_statistics s ON u.id = s.id
WHERE s.Mean <> 0
GROUP BY u.Type
HAVING Count(*) > 100
ORDER BY 2 DESC;
