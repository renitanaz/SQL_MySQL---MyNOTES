USE `ineuronfsda`;
-- SELECT Queries 
-- Basic select queries 
SELECT * FROM bank_details;

-- Basic select query with column name 
SELECT age,balance FROM bank_details;

-- using keywords DISTINCT 
select distinct job from bank_details ;

-- WHERE with arithmatic operators 
select * from bank_details where age  =  33;
select * from bank_details where age > 60;

-- AND , OR, NOT
select * from bank_details where age = 60 and job = 'retired';
select * from bank_details where education = 'unknown' or marital = 'single';
select * from bank_details where (education = 'unknown' or marital = 'single') and balance < 500;

-- BETWEEN , NOT BETWEEN
select * from bank_details where age between 20 and 30;
select * from bank_details where age not between 20 and 30;
-- ORDER BY
select * from bank_details order by age ;
select * from bank_details order by age desc ;

-- IS NULL, IS NOT NULL

-- TOP(SQL), LIMIT (my sql)
select * from bank_details limit 10;
select * from bank_details order by balance limit 1;
-- SELECT TOP number|percent column_name(s) FROM table_name WHERE condition;

-- MIN MAX AVG COUNT SUM functions
select count(*) from  bank_details;
select avg(balance) from bank_details;
select  * ,  min(balance) from bank_details;

-- LIKE (https://www.w3schools.com/sql/sql_like.asp , https://www.w3schools.com/sql/sql_wildcards.asp) 
select * from bank_details where job LIKE "a%"; -- Finds any values that start with "a"
select * from bank_details where job LIKE "%min."; -- Finds any values that end with "min."
select * from bank_details where job LIKE "_d%"; -- Finds any values that have "d" in the second position
select * from bank_details where job LIKE "a__%"; -- Finds any values that start with "a" and are at least 2 characters in length
select * from bank_details where job LIKE "a%n."; -- Finds any values that start with "a" and ends with "n."

-- IN
select * from bank_details where education in ("tertiary","primary");

-- subqueries
select * from bank_details where balance in (select min(balance) from bank_details);
select * from bank_details where balance in (select max(balance) from bank_details);
select * from bank_details where balance =  ( select min(balance) from  bank_details);
select * from bank_details where balance =  ( select max(balance)    from  bank_details);

-- Alias

SELECT age as agealias,balance as balancealias FROM bank_details Bd;