-- DROP DATABASE ZOO;
CREATE DATABASE ZOO;
Use ZOO;

CREATE TABLE zoo_spendings(
  spending_id int PRIMARY KEY AUTO_INCREMENT,
  category varchar(100),
  name varchar(100),
  spending_sum int UNSIGNED ,
  spending_date datetime 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE zoo_spendings COMMENT = 
'Purchases made on behalf of the Zoo, including maintainence and salaries

+----------------+----------------+
| Column Name    | Type           |
+----------------+----------------+
| spending_id    | int            |
| category       | varchar(100)   |
| name           | varchar(100)   |
| spending_sum   | int unsigned   |
| spending_date  | datetime       |
+----------------+----------------+';


CREATE TABLE investors(
  investor_id int PRIMARY KEY AUTO_INCREMENT,
  investor_name varchar(100),
  investor_surname varchar(100) NOT NULL ,
  fund varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE investors COMMENT = 
'The entities who invested any sum into the Zoo

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| investor_id       | int            |
| investor_name     | varchar(100)   |
| investor_surname  | varchar(100)   |
| fund              | varchar(100)   |
+-------------------+----------------+';


CREATE TABLE investments(
  investment_id int PRIMARY KEY AUTO_INCREMENT,
    investor_id int NOT NULL,
  investment_sum int UNSIGNED ,
  investment_date datetime,
  FOREIGN KEY (investor_id) REFERENCES investors(investor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE investments COMMENT =
'Monetary investments into the Zoo made by individual and legal entities which may be anonimous

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| investment_id     | int            |
| investor_id       | int            |
| investment_sum    | int unsigned   |
| investment_date   | datetime       |
+-------------------+----------------+';


CREATE TABLE animal_scientific_info(
  scientific_name varchar(200) PRIMARY KEY,
  is_predator boolean
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE animal_scientific_info COMMENT =
'All unique animal species names present in the Zoo and some properties of that species

+--------------------+----------------+
| Column Name        | Type           |
+--------------------+----------------+
| scientific_name    | varchar(200)   |
| is_predator        | boolean        |
+--------------------+----------------+';

CREATE TABLE animals(
  animal_id int PRIMARY KEY AUTO_INCREMENT,
  scientific_name varchar(200) NOT NULL, 
  nickname varchar(100) NOT NULL,
  age_status varchar(25) CHECK(age_status = 'baby' OR age_status = 'adult'),
  FOREIGN KEY (scientific_name) REFERENCES animal_scientific_info(scientific_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE animals COMMENT =
'All animals that live in the Zoo at a current moment 

+--------------------+----------------+
| Column Name        | Type           |
+--------------------+----------------+
| animal_id          | int            |
| scientific_name    | varchar(200)   |
| nickname           | varchar(100)   |
| age_status         | adult/baby     |
+--------------------+----------------+';


CREATE TABLE food (
  food_id int PRIMARY KEY AUTO_INCREMENT,
  food_name varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE food COMMENT =
'All foods that any animal eats

+----------------+----------------+
| Column Name    | Type           |
+----------------+----------------+
| food_id        | int            |
| food_name      | varchar(100)   |
+----------------+----------------+';


CREATE TABLE animals_food (
  scientific_name varchar(100), 
  food_id int,
  FOREIGN KEY (scientific_name) REFERENCES animal_scientific_info(scientific_name),
  FOREIGN KEY (food_id) REFERENCES food(food_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE animals_food COMMENT = 
'Each entry represents a unique combination of species and one food they consume

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| scientific_name   | varchar(100)   |
| food_id           | int            |
+-------------------+----------------+';

 
CREATE TABLE services(
  service_id int PRIMARY KEY AUTO_INCREMENT,
  service_category varchar(100) NOT NULL,
  service_name varchar(100) NOT NULL,
  service_cost int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE services COMMENT = 
'Servises the Zoo offers to its customers

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| service_id        | int            |
| service_category  | varchar(100)   |
| service_name      | varchar(100)   |
| service_cost      | int unsigned   |
+-------------------+----------------+';


CREATE TABLE customer_additional_spendings(
  spending_id int PRIMARY KEY AUTO_INCREMENT,
  category varchar(100),
  service_id int,
  spending_sum int UNSIGNED ,
  spending_date datetime,
  -- customer_id
  FOREIGN KEY (service_id) REFERENCES services(service_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE customer_ticket_purchases COMMENT = 
'Customer spendings excluding ticket purchases, related to services on service_id

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| spending_id       | int            |
| category          | varchar(100)   |
| service_id        | int            |
| spending_sum      | int unsigned   |
| spending_date     | datetime       |
+-------------------+----------------+';


CREATE TABLE customer_ticket_purchases(
  spending_id int PRIMARY KEY AUTO_INCREMENT,
  ticket_type varchar(25) CHECK (ticket_type = "regular" OR ticket_type = "discount"),
  ticket_cost int UNSIGNED,
  spending_date datetime
  -- customer_id
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE customer_ticket_purchases COMMENT = 
'Customers ticket purchases. There are two tickets categories available: regular and with discount

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| spending_id       | int            |
| ticket_type       | varchar(25)    |
| ticket_cost       | int unsigned   |
| spending_date     | datetime       |
+-------------------+----------------+';


CREATE TABLE staff(
  staff_id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  surname varchar(100),
  salary int UNSIGNED 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE staff COMMENT = 
'The people who work at the Zoo

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| staff_id          | int            |
| name              | varchar(100)   |
| surname           | varchar(100)   |
| salary            | int unsigned   |
+-------------------+----------------+';

CREATE TABLE staff_card(
  staff_card_id int PRIMARY KEY AUTO_INCREMENT,
  staff_id int,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE staff_card COMMENT = 
'Entry cards of each staff member. Has 1 to 1 relation to Staff table on staff_id

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| staff_card_id     | int            |
| staff_id          | int            |
+-------------------+----------------+';

CREATE TABLE responsibilty(
  staff_id int, 
  occupation varchar(150),
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE responsibilty COMMENT = 
'Occupations of each staff member, e.g. Cleaner, Caretaker, Vet

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| staff_id          | int            |
| occupation        | varchar(150)   |
+-------------------+----------------+';


CREATE TABLE caretakers(
  staff_id int,
  animal_id int, 
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
  FOREIGN KEY (animal_id) REFERENCES animals(animal_id) ON DELETE CASCADE,
PRIMARY KEY(staff_id, animal_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE caretakers COMMENT = 
'The staff members who are responsible for looking after animals

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| staff_id          | int            |
| animal_id         | int            |
+-------------------+----------------+';


CREATE TABLE vet_visits(
  animal_id int, 
  checkup_date datetime,
  is_ill boolean,
  FOREIGN KEY (animal_id) REFERENCES animals(animal_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE vet_visits COMMENT = 
'Registry of scheduled and irregular vet visits of the animals

+-------------------+----------------+
| Column Name       | Type           |
+-------------------+----------------+
| animal_id         | int            |
| checkup_date      | datetime       |
| is_ill            | boolean        |
+-------------------+----------------+';


CREATE TABLE dead_animals(
  animal_id int PRIMARY KEY AUTO_INCREMENT,
  scientific_name varchar(200) NOT NULL, 
  nickname varchar(100) NOT NULL,
  age_status varchar(25) CHECK(age_status = 'baby' OR age_status = 'adult'),
  death_date date,
  FOREIGN KEY (scientific_name) REFERENCES animal_scientific_info(scientific_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE dead_animals COMMENT = '
+-------------------+------------------------------+
| Column Name       | Type                         |
+-------------------+------------------------------+
| animal_id         | int                          |
| scientific_name   | varchar(200)                 |
| nickname          | varchar(100)                 |
| age_status        | CHECK ('baby' or 'adult')    |
| death_date        | date                         |
+-------------------+------------------------------+ ';

