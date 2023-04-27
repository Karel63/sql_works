CREATE SCHEMA IF NOT EXISTS `plang` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `plang`;

CREATE TABLE IF NOT EXISTS `plang`.`lang` (
    `idlang` INT NOT NULL AUTO_INCREMENT,
    `designation` VARCHAR(30) NOT NULL,
    `created` INT NULL,
    PRIMARY KEY (`idlang`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `plang`.`author` (
    `idauthor` INT NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(30) NULL,
    `surname` VARCHAR(40) NULL,
    `company` VARCHAR(40) NULL,
    PRIMARY KEY (`idauthor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `plang`.`createdby` (
    `idcreatedby` INT NOT NULL AUTO_INCREMENT,
    `lang_idlang` INT NOT NULL,
    `author_idauthor` INT NOT NULL,
    INDEX `fk_createdby_lang_idx` (`lang_idlang` ASC),
    INDEX `fk_createdby_author_idx` (`author_idauthor` ASC),
    PRIMARY KEY (`idcreatedby`))
ENGINE = InnoDB;

DROP PROCEDURE IF EXISTS add_person
DELIMITER //
CREATE PROCEDURE add_person
(
    IN idauthor INT CHARACTER SET 'utf8',
    IN firstname VARCHAR(30) CHARACTER SET 'utf8',
    IN surname VARCHAR(40) CHARACTER SET 'utf8',
    IN company VARCHAR(40) CHARACTER SET 'utf8'
)
BEGIN
    INSERT INTO plang.author(idauthor, firstname, surname, company) VALUES(NULL, firstnam, surenam, compan);
END // DELIMITER;

CALL add_person('Yukihiro', 'Matsumoto', NULL);