SELECT * 
FROM venteddemaisons.time;
INSERT INTO time (time_timeslot) VALUES ('06:00:00'), ('12:00:00'), ('13:00:00'), ('14:00:00');
SELECT *
FROM venteddemaisons.biensimmo;
INSERT INTO biensimmo (biensimmo_name, biensimmo_postalcode, biensimmo_price, category_id)
VALUES ('appartement Tatooine', '77777', '350000', 3), ('rooftop nightCity', '66666', '200000', 3), ('taupiniere', '14500', '180000', 1);