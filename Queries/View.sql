CREATE VIEW animal_babies AS
  SELECT * FROM animals
  WHERE age_status = 'baby';