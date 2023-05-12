CREATE SCHEMA IF NOT EXISTS driving
DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;

USE driving;

CREATE TABLE IF NOT EXISTS driver(
    id INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    age TINYINT UNSIGNED, 
    alcohol FLOAT UNSIGNED, 
    licence TINYINT UNSIGNED,
    PRIMARY KEY (id))
ENGINE = InnoDB;

DELIMITER //
CREATE TRIGGER check_driver_age BEFORE INSERT ON driver
FOR EACH ROW
    IF NEW.age < 18 THEN
        SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Driver must be 18 or older.';
    END IF //

CREATE TRIGGER check_driver_alcohol BEFORE INSERT ON driver
FOR EACH ROW
    IF NEW.alcohol >= 1 THEN
        SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'Driver is drunk.';
    END IF //

CREATE TRIGGER check_driver_licence BEFORE INSERT ON driver
FOR EACH ROW
    IF NEW.licence = 0 THEN
        SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Driver must have a driving licence.';
    END IF //
DELIMITER ;

INSERT INTO driver (id, firstname, lastname, age, alcohol, licence) VALUES
    (NULL, 'Jan', 'Sedlák', 41, 0.2, 1),
    (NULL, 'Tomáš', 'Marný', 18, 0, 1),
    (NULL, 'Filip', 'Práh', 48, 1.1, 1);