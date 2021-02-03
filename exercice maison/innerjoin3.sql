SELECT clients_lastname, clients_firstname, clients_budget, category_type
FROM clients
INNER JOIN category ON clients.category_id = category.category_id;