DELIMITER //

CREATE TRIGGER add_vet_expances
AFTER INSERT ON vet_visits
FOR EACH ROW
BEGIN
  INSERT INTO zoo_spendings (category, name, spending_sum, spending_date)
  VALUES (
  'Veterinary services',
  CONCAT('Visit for ', NEW.animal_id),
  500,
  NEW.checkup_date
  );
END //

DELIMITER ;
