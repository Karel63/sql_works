/* vytvořit tabulku */
CREATE TABLE demo (
    /* atribut id pro entity */
    id int UNSIGNED NOT NULL AUTO_INCREMENT,
    /* atribut jméno pro entity */
    jmeno varchar(50) NOT NULL,
    /* atribut věk pro entity */
    vek tinyint NOT NULL UNSIGNED,
    /* atribut narozené pro entity */
    narozeni date NOT NULL,
);
