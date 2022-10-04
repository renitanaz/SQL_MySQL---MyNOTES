-- constraints
 -- creating table with all constains
 -- inserting into a table with constains 
 -- updating constarints
 --  primary key and foriegn key
/* 
			NOT NULL - Ensures that a column cannot have a NULL value
			UNIQUE - Ensures that all values in a column are different
			PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
			FOREIGN KEY - Prevents actions that would destroy links between tables
			CHECK - Ensures that the values in a column satisfies a specific condition
			DEFAULT - Sets a default value for a column if no value is specified
			CREATE INDEX - Used to create and retrieve data from the database very quickly */
-- creating table with all constains
		create table if not exists test8(                   
		test_id int NOT NULL auto_increment  ,           -- NOT NULL, auto_increment 
		test_name varchar(30)  NOT NULL default 'unknown' ,    -- default
		test_mailid varchar(30) unique NOT NULL,				-- unique
		teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,  -- check
		test_salary int check(test_salary > 10000) NOT NULL, -- check
		primary key (test_id)) ;                               -- primary key
        
-- inserting into a table with constains 
			insert into test ( test_name , test_mailid , teast_adress,test_salary) 
		values ('sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
			('krish','krish@gmail.com', 'bengalore' , 30000),
			('hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
			('shubahm' , 'shudham@gmail.com', 'jaipur',20000);
	
 -- updating constarints - updating table 
		alter table test add constraint test_prim primary key(id , email_id);
 
 --  primary key and foriegn key
		 create table parent(
		id int not null ,
		primary key(id));

		create table child (
		id int ,
		parent_id int ,
		foreign key (parent_id) references parent(id));
