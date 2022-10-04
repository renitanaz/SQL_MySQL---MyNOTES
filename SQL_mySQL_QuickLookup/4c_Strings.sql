create table bankcustomer(
firstname varchar(20),
lastname varchar(20),
area varchar(20),
country varchar(20),
address varchar(100)
);

insert into bankcustomer values 
( "firstname1","lastname1","area1","country1", "addressLine11 addressline 12"),
( "firstname2","lastname2","area2","country2","addressLine21 addressline 22"),
( "firstname3","lastname3","area3","country3","addressLine31 addressline 32"),
( "firstname4","lastname4","area4","country4","addressLine41 addressline 42"),
( "firstname5","lastname5","area5","country5","addressLine51 addressline 52"),
( "firstname6","lastname6","area6","country6","addressLine61 addressline 62");
-- ********************************************************************************************

/* display full names*/

SELECT CONCAT(firstname,'',lastname) FROM bankcustomer;

/*concat_ws with seperator between all specified columns*/
SELECT CONCAT_WS("_",firstname,lastname) FROM bankcustomer;

/* display - Life*/
SELECT SUBSTRING('AwesomeLife',8,11);

-- 'meLife'
SELECT SUBSTRING('AwesomeLife',6);
-- life
SELECT SUBSTRING('AwesomeLife',-4);


/*replace Life with World
Result => AwesomeWorld
*/
SELECT REPLACE('AwesomeLife', 'Life', 'World');

/*replace ' ' wit ' and '
Result => cheese and bread and coffee and milk*/
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

SELECT REVERSE('AwesomeLife');

/*Result => 11*/
SELECT CHAR_LENGTH('AwesomeLife');


SELECT UPPER('AwesomeLife');


SELECT LOWER('AwesomeLife');

/* ---------------------------- */

/*Reverse and Uppercase the following sentence

SELECT REVERSE(UPPER('If you can dream it,you can do it'));


/*Replace spaces in titles with '->'*/
SELECT REPLACE(address,' ','->')
FROM bankcustomer;


SELECT concat(firstname,' lives in  ',area) 
FROM bankcustomer;

