-- how much each investor invested for all time

SELECT SUM(i.investment_sum) as total_investments_sum
FROM investments i
INNER JOIN investors v
ON i.investor_id = v.investor_id
GROUP BY i.investor_id;


-- caretakers of animal (animal which id is 4)

SELECT 
	staff_id,
	name,
	surname
FROM staff
WHERE staff_id IN 
	(SELECT 
		staff_id
	FROM caretakers 
	WHERE animal_id = 4
	)
;

-- caretakers who are responsible for ill animals

SELECT 
	staff_id,
	name,
	surname
FROM staff
WHERE staff_id IN (
	SELECT 
		c.staff_id
	FROM caretakers c
	INNER JOIN vet_visits v
	ON c.animal_id = v.animal_id
	);

-- all animals that have specific part in scientific name
SELECT * FROM animals
WHERE MATCH(scientific_name) AGAINST('cat');


SELECT * FROM customer_additional_spendings WHERE spending_sum > 500;


SELECT * FROM investors 
WHERE MATCH (investor_name, investor_surname) AGAINST('Marry');


