SELECT appointment_date, time_timeslot, biensImmo_name, category_type, biensImmo_postalCode, clients_firstname, clients_lastname, biensImmo_price
FROM appointment
INNER JOIN biensimmo ON appointment.biensImmo_id = biensimmo.biensImmo_id
INNER JOIN category ON category.category_id = biensimmo.category_id
INNER JOIN clients ON appointment.clients_id = clients.category_id
INNER JOIN time ON appointment.time_id = time.time_id
ORDER BY appointment_date DESC;