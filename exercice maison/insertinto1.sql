SELECT * 
FROM venteddemaisons.clients;
INSERT INTO clients (clients_firstname, clients_lastname, clients_birthDate, clients_mail, clients_budget, category_id)
VALUES ('Sonic', 'the Hedgehog', '1980-03-12', 'anneau@gmail.com', '50000', '1'), ('Anakin', 'Skywalker', '1999-05-23', 'darthvader@gmail.com', '250000', '2'), ('Rin', 'Okumura', '2015-12-31', 'Satan@gmail.com', '100000', '3'), ('Kyo', 'Soma', '1995-06-24', 'neko@gmail.com', '150000', '2');
SELECT * FROM clients;