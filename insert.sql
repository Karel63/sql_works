/* vložení jména, věku a narození pro Karla */
INSERT INTO demo (jmeno, vek, narozeni) VALUES ("Karel", 16, 2005-06-17);
/* vložení jména, věku a narození pro Evžena */
INSERT INTO demo (jmeno, vek, narozeni) VALUES ("Evžen", 19, 2001-01-05);
/* updatování jména */
UPDATE demo SET jmeno = "Jan" WHERE id = 1;
/* Smazání záznamu s id 2 */
DELETE FROM demo WHERE id = 2;
/* Vybrání všeho z tabulky demo */
SELECT * FROM demo
/* Vybrání jména a věku z tabulky demo */
SELECT jmeno, vek FROM demo
/* Vybrání jména a věku kde id je rovno 1 nebo 2 */
SELECT jmeno, vek FROM demo WHERE id = 1 OR 2
/* Vybrání jména a věku z tabulky demo, a seřazené podle jmána */
SELECT jmeno, vek FROM demo ORDER BY jmeno
/* Vybrání jména a věku z tabulky demo, seřazeno podle jmána, a vypsané pouze první 3 entity */
SELECT jmeno, vek FROM demo ORDER BY jmeno LIMIT 3
