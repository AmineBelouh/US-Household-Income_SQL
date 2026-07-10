USE us_household_income;

SELECT * FROM us_household_income;
SELECT * FROM ushouseholdincome_statistics;

# Removing Duplicates 
DELETE FROM us_household_income
WHERE row_id IN (
	SELECT 
		row_id
	FROM (
	SELECT 
		row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id) AS row_num 
	FROM us_household_income
	) AS row_num_subquery
	WHERE row_num > 1
	);
    
    
    
SELECT COUNT(*) FROM us_household_income; # 32526
SELECT COUNT(*) FROM ushouseholdincome_statistics; # 32526



# Looking for problems in 'State_Name' Column
SELECT
	State_Name,
	COUNT(*)
FROM us_household_income
GROUP BY State_Name;

# Correcting 'georia'
UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';



# Populating Nulls in 'Place' Column
SELECT * 
FROM us_household_income
WHERE Place IS NULL;

SELECT * 
FROM us_household_income
WHERE County =  'Autauga County' AND City = 'Vinemont';

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County =  'Autauga County' AND Place IS NULL;



# 'Type' Column
SELECT
	Type,
	COUNT(*)
FROM us_household_income
GROUP BY Type;

# Changing 'Boroughs' to 'Borough'
UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';