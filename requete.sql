-- Pour voir toute les bases déjà créee.

SHOW DATABASES;

--Exo 1 : Créer une base de données languages.

CREATE DATABASE language;

-- Exo 2 : Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE webDevelopment CHARACTER SET utf8 COLLATE utf8_general_ci;

--Exo 3 : Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS frameworks CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Exo 4 : Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS languages CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Exo 5 : Supprimer la base de données languages.
DROP DATABASE languages;

-- Exo 6 : Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS frameworks;

-- Exo 7 : Supprimer la base de données languages si elle existe.
DROP DATABASE IF EXISTS languages;

-- Partie 2
-- Exo 1 : Dans la base de données webDevelopment, créer la table languages avec les colonnes :
-- id (type INT, auto-incrémenté, clé primaire)
-- language (type VARCHAR)
CREATE TABLE webDevelopment.table_languages (id INT AUTO_INCREMENT PRIMARY KEY,language varchar(20));

-- Exo 2 :Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes :

-- id (type INT, auto-incrémenté, clé primaire)
-- tool (type VARCHAR)

CREATE TABLE webDevelopment.tool (id INT AUTO_INCREMENT PRIMARY KEY,library varchar(20));

-- Exo 3 : Dans la base de données webDevelopment, créer la table frameworks avec les colonnes suivantes :

-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)

CREATE TABLE webDevelopment.frameworks (id INT AUTO_INCREMENT PRIMARY KEY,name varchar(20));

-- Exo 4 : Dans la base de données webDevelopment, créer la table libraries avec les colonnes suivantes :

-- id (type INT, auto-incrémenté, clé primaire)
-- library (type VARCHAR)

CREATE TABLE webDevelopment.libraries (id INT AUTO_INCREMENT PRIMARY KEY,library varchar(20));

-- Exo 5 : Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :

-- id (type INT, auto-incrémenté, clé primaire)
-- ideName (type VARCHAR)

CREATE TABLE webDevelopment.ide (id INT AUTO_INCREMENT PRIMARY KEY,ideName varchar(20));

-- Exo 6 : Dans la base de données webDevelopment, créer, si elle n'existe pas, la table frameworks avec les colonnes suivantes :

-- id (type INT, auto-incrémenté, clé primaire)
-- name (type VARCHAR)


-- ex 8
DROP TABLE libraries;

-- ex 9
DROP TABLE ide;

-- TP
CREATE TABLE clients ( id INT AUTO_INCREMENT PRIMARY KEY, lastname VARCHAR(20), firstname VARCHAR(20), 
birthDate DATE, address VARCHAR(20), firstPhoneNumber INT, secondPhoneNumber INT, mail VARCHAR(20) );

-- PARTIE 3
-- ex 1
ALTER TABLE languages
ADD versions VARCHAR(50);

-- ex 2
ALTER TABLE frameworks
ADD version INT;

-- ex 3
ALTER TABLE languages
CHANGE versions version VARCHAR(50);

-- ex 4
ALTER TABLE frameworks
CHANGE name framework VARCHAR(20);

-- ex 5
ALTER TABLE frameworks
MODIFY version VARCHAR(10);

-- TP
ALTER TABLE clients
    -> DROP secondPhoneNumber;

ALTER TABLE clients
    -> CHANGE firstPhoneNumber phoneNumber INT;

ALTER TABLE clients
    -> MODIFY phoneNumber VARCHAR(20);

ALTER TABLE clients
    -> ADD zipCode VARCHAR(20),
    -> ADD city VARCHAR(20);

-- PARTIE 4
-- ex 1
INSERT INTO languages (language, version) VALUES ('JavaScript', 'version 5'), ('PHP', 'version 5.2'), ('PHP', 'version 5.4'), 
('HTML', 'version 5.1'), ('JavaScript', 'version 6'), ('JavaScript', 'version 7'), ('JavaScript', 'version 8'), ('PHP', 'version 7');

-- ex 2
INSERT INTO frameworks (framework, version) VALUES ('Symfony', 'version 2.8'), ('Symfony', 'version 3'), 
('Jquery', 'version 1.6'), ('Jquery', 'version 2.10');

-- PARTIE 5
-- ex 1
SELECT language, version FROM languages;

-- ex 2
SELECT *
    -> FROM languages
    -> WHERE language IN ('PHP');

-- ex 3
SELECT *
    -> FROM languages
    -> WHERE language IN ('PHP', 'JavaScript');

-- ex 4
SELECT *
    -> FROM languages
    -> WHERE id IN ('3', '5', '7');

-- ex 5
SELECT *
    -> FROM languages
    -> WHERE language = 'JavaScript' LIMIT 2;

-- ex 6
SELECT *
FROM languages
WHERE NOT language = 'PHP';

-- ex 7
SELECT *
FROM languages
ORDER BY language;

-- PARTIE 6
-- ex 1
SELECT *
FROM frameworks
WHERE version > 'version 2' AND version < 'version 3';
-- ou WHERE version LIKE 'version2.%';

-- ex 2
SELECT *
FROM frameworks
WHERE id IN (1, 3);

-- ex 3
SELECT *
FROM ide
WHERE date > '2010-01-01' AND date < '2011-12-31';
-- ou WHERE date BETWEEN '2010-01-01' AND '2011-12-31'; 

-- PARTIE 7
-- ex1
DELETE FROM languages
WHERE language = 'HTML';

-- ex 2
UPDATE frameworks
SET framework = 'Symfony2'
WHERE framework = 'Symfony';

-- ex 3
UPDATE languages
SET version = 'version 5.1'
WHERE version = 'version 5' AND language = 'JavaScript';

-- PARTIE 8
-- ex 1
SELECT *
FROM languages
LEFT JOIN frameworks 
ON frameworks.languagesId = languages.id;

-- ex 2
SELECT *
FROM frameworks
INNER JOIN languages ON frameworks.languagesId = languages.id;

-- ex 3
SELECT languages.name as language, COUNT(frameworks.name) as total
FROM frameworks
INNER JOIN languages ON frameworks.languagesId = languages.id
GROUP BY languages.name;

-- ex 4
SELECT languages.name as language, COUNT(frameworks.name) as totalframework
FROM languages
INNER JOIN frameworks 
ON frameworks.languagesId = languages.id
GROUP BY languages.name
HAVING COUNT(frameworks.name) > 3;