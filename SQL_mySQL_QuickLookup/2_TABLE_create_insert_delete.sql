-- index:table
-- 1) creating  / with all constaints / automated table creation using csvkit.
-- 2) loading data from csv file (secure-file-priv errors - check the error sql notes)
-- 3) insert  4) update  5) alter table - add, modify  6) delete table 

####################################################################################
-- 1) creating table
	create table if not exists bank_details(
	age int,
	job varchar(30),
	marital varchar(30),
	education varchar(30),
	`default` varchar(30),
	balance int , 
	housing varchar(30),
	loan varchar(30) , 
	contact varchar(30),
	`day` int,
	`month` varchar(30) , 
	duration int , 
	campaign int,
	pdays int , 
	previous int , 
	poutcome varchar(30) , 
	y varchar(30));
    
 -- constrain

/* 
			NOT NULL - Ensures that a column cannot have a NULL value
			UNIQUE - Ensures that all values in a column are different
			PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
			FOREIGN KEY - Prevents actions that would destroy links between tables
			CHECK - Ensures that the values in a column satisfies a specific condition
			DEFAULT - Sets a default value for a column if no value is specified
			CREATE INDEX - Used to create and retrieve data from the database very quickly */
-- 1b) creating table with all constains
		create table if not exists test8(                   
		test_id int NOT NULL auto_increment  ,           -- NOT NULL, auto_increment 
		test_name varchar(30)  NOT NULL default 'unknown' ,    -- default
		test_mailid varchar(30) unique NOT NULL,				-- unique
		teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,  -- check
		test_salary int check(test_salary > 10000) NOT NULL, -- check
		primary key (test_id)) ;                               -- primary key
        
        -- inserting into a table with constains 
			insert into test ( test_name , test_mailid , teast_adress,test_salary) 
		values ('Jack','Jack@ineuron.ai','benglaore' , 50000),
			('Jill','Jill@gmail.com', 'bengalore' , 30000),
			('Ann' ,'Ann@ineuron.ai','bengalore' , 111000),
			('Mary' , 'Mary@gmail.com', 'jaipur',20000);
	



-- 1c) automated table creation using csvkit. 
		/* 
        pip install csvkit        
		
		 command to generate create table statement from the csv file and save in sql file provided
		csvsql --dialect mysql --snifflimit 100000 sales.csv > output_sales.sql
		*/
    
-- 2)loading data from csv file (secure-file-priv errors - check the error sql notes)
		/*case 1:	
					LOAD DATA INFILE  
					'D:/AttributeDataSet.csv'
					into table dress
					FIELDS TERMINATED by ','
					ENCLOSED by '"'
					lines terminated by '\n'
					IGNORE 1 ROWS;
            
		case 2: when thousand comma seperator causes problem
				load data infile 
				'C:/Ren/learnings/mySQL/My_sql_In/sales_data_final.csv'
				into table sales3 
				fields terminated by ',' 
				-- ESCAPED BY '"'
				enclosed by '"'
				lines terminated by '\n'
				ignore 1 rows 
				(order_id,order_date,ship_date,ship_mode,customer_name,segment,state,country,market,region,product_id,category,
				sub_category,product_name,@sales,quantity,discount,profit,shipping_cost,order_priority,`year`)
				SET sales = replace(@sales,",","")
                
                you can also SET SESSION sql_mode = ''
                SELECT @@GLOBAL.sql_mode;
				SELECT @@SESSION.sql_mode;
		*/

-- 3) insert into table
/*
-- insert into table (single row) - case 1: inserting all columns
		insert into bank_details values(58,"management","married","tertiary","no",
        2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");

-- insert into table (single row) - case : when inserting selected columns 
		insert into bank_details(age,job ,marital,education )values(58,"management","married","tertiary");
*/
-- 4)update table
		/*
		 update sales3 SET ship_date_new=str_to_date(ship_date,'%m/%d/%Y')	
         
         Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses 
         a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	
         Solution:SET SQL_SAFE_UPDATES = 0;
		*/
-- 5) alter table - add, modify 
	/* alter - add
    alter table sales1 
    add column order_date_new  date  -- add column with name order_date_new and type date
    after order_date  -- add column after order_date
	*/
	/* alter -modify
    ALTER TABLE sales1 MODIFY COLUMN year datetime;
    */
-- 6) delete table 
-- DELETE FROM table_name WHERE condition;