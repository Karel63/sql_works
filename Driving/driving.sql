-- Vytváření nového schéma které zkoumá jestli daný člověk může řídit --
CREATE SCHEMA IF NOT EXISTS driving
DEFAULT CHARACTER SET utf8;
USE driving;

-- Nová tabulka driver --
CREATE TABLE IF NOT EXISTS driver(
    id INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    age TINYINT UNSIGNED, 
    -- Alkohol značí promile --
    alcohol FLOAT UNSIGNED,
    -- Licence značí jestli má nebo nemá licenci (bool) --
    licence TINYINT UNSIGNED,
    PRIMARY KEY (id))
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER check_driver_age BEFORE INSERT ON driver
FOR EACH ROW
    -- pokud je mladší než 18 let --
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Driver must be 18 or older.';
    END IF //

CREATE TRIGGER check_driver_alcohol BEFORE INSERT ON driver
FOR EACH ROW
    -- pokud je promile vyšší než 1.0 --
    IF NEW.alcohol >= 1 THEN
        SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Driver is drunk.';
    END IF //

CREATE TRIGGER check_driver_licence BEFORE INSERT ON driver
FOR EACH ROW
    -- pokud nemá licenci --
    IF NEW.licence = 0 THEN
        SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'Driver must have a driving licence.';
    END IF //
DELIMITER ;

-- Dotazy které budou fungovat --
INSERT INTO driver (id, firstname, lastname, age, alcohol, licence) VALUES
    (NULL, 'Carl', 'Manson', 41, 0.9, 1),
    (NULL, 'Thomas', 'Crown', 18, 0, 1),
    (NULL, 'July', 'Germani', 35, 0.2, 1);

-- Dotazy které triggry odmítnou --
INSERT INTO driver (id, firstname, lastname, age, alcohol, licence) VALUES
    (NULL, 'John', 'Quip', 17, 0.5, 1),
    (NULL, 'Louis', 'Jany', 55, 0.1, 0),
    (NULL, 'Brad', 'Wilson', 23, 2.4, 1);
