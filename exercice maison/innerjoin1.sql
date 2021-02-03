SELECT biensimmo_name, biensImmo_postalCode, category_type, biensimmo_price
FROM biensimmo
INNER JOIN category ON biensImmo.category_id = category.category_id
ORDER BY biensImmo_price DESC;