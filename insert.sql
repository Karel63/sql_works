/*
úpravu záznamu
smazání záznamu
výběr s projekcí
výběr s projekcí a novým dopočítaným sloupcem
výběr se selekcí (užijte porovnání i logické spojky)
výběr s řazením
výběr s limitem
práci s textem
práci s datumem 
*/

/* vložení jména a věku */
INSERT INTO demo (jmeno, vek) VALUES ("Karel", 16);
/* updatování jména */
UPDATE demo SET jmeno = "Jan" WHERE id = 1;
/* Smazání záznamu s id 2 */
DELETE FROM demo WHERE id = 2;
