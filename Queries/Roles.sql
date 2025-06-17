CREATE ROLE head_accountant;

GRANT INSERT, SELECT ON zoo.zoo_spendings TO head_accountant;
GRANT INSERT, SELECT ON zoo.investments TO head_accountant;
GRANT INSERT, SELECT ON zoo.investors TO head_accountant;
GRANT INSERT, SELECT ON zoo.services TO head_accountant;
GRANT INSERT, SELECT ON zoo.customer_additional_spendings TO head_accountant;
GRANT INSERT, SELECT ON zoo.customer_ticket_purchases TO head_accountant;

CREATE ROLE caretaker;

GRANT SELECT on zoo.animals TO caretaker;
GRANT SELECT on zoo.animal_scientific_info TO caretaker;
GRANT SELECT on zoo.food TO caretaker;
GRANT SELECT on zoo.animals_food TO caretaker;
GRANT SELECT on zoo.responsibilty TO caretaker;
GRANT SELECT on zoo.vet_visits TO caretaker;


CREATE ROLE owner;
GRANT ALL PRIVILEGES ON zoo.* TO owner;