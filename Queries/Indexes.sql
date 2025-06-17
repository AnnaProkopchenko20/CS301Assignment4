ALTER TABLE animals ADD FULLTEXT INDEX `fulltext`(scientific_name);

ALTER TABLE investors ADD FULLTEXT INDEX `fulltext`(investor_name, investor_surname);

ALTER TABLE staff ADD FULLTEXT INDEX `fulltext`(name, surname);
