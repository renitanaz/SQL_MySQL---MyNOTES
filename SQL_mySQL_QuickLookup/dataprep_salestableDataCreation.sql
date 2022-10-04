
CREATE DATABASE SALESDB;

USE SALESDB;

-- DROPPING TABLE IF ALREADY EXSIST
DROP TABLE IF exists sales_gh;
-- creating sales table

							

CREATE TABLE sales_gh (
  order_id varchar(15) NOT NULL,
  flag varchar(15) DEFAULT NULL,
  order_date varchar(15) NOT NULL,
  order_date_dateformat date DEFAULT NULL,
  ship_date varchar(15) NOT NULL,
  ship_date_dateformat date DEFAULT NULL,
  ship_mode varchar(14) NOT NULL,
  customer_name varchar(22) NOT NULL,
  segment varchar(11) NOT NULL,
  state varchar(36) NOT NULL,
  country varchar(32) NOT NULL,
  market varchar(6) NOT NULL,
  region varchar(14) NOT NULL,
  product_id varchar(16) NOT NULL,
  category varchar(15) NOT NULL,
  sub_category varchar(11) NOT NULL,
  product_name varchar(127) NOT NULL,
  sales decimal(38,0) NOT NULL,
  quantity decimal(38,0) NOT NULL,
  discount decimal(38,3) NOT NULL,
  discount_flag varchar(20) DEFAULT NULL,
  profit decimal(38,8) NOT NULL,
  shipping_cost decimal(38,2) NOT NULL,
  order_priority varchar(8) NOT NULL,
  year decimal(38,0) NOT NULL
) ;
									
	
 -- save SalesDataset file in a loctaion and execute below statment
 
LOAD DATA INFILE  
'C:/Ren/learnings/mySQL/SQL_mySQL_QuickLookup/SalesDataset.csv'
into table sales_gh
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

