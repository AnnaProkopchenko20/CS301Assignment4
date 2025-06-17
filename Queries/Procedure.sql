CREATE PROCEDURE IF NOT EXISTS delete_animal_records(IN p_animal_id int)
BEGIN
    INSERT INTO dead_animals(scientific_name, nickname, age_status, death_date)
        SELECT 
            a.scientific_name, a.nickname, a.age_status, CURRENT_DATE()   
            FROM animals a      
            WHERE a.animal_id = p_animal_id;
            
    DELETE FROM animals a WHERE a.animal_id = p_animal_id;
END
