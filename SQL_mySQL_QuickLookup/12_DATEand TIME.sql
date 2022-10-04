/* data prep */
   -- execute dataprep_banktableDataCreation
-- ************************************************************
-- genral functions
	-- 1) current timestamps: now() , curdate() , curtime()
		select now();
        select curdate();
        select curtime();
    
-- 2) get info from the date - day/month/year/dayname
			select year(now());
			select dayname('2022-09-20 21:10:30');
            select DAYOFWEEK(now());
            
-- 3) ADD - subtract day /month year	
			select date_sub(now() , interval 1 week);  -- DATE BEFORE 1 WEEK FROM NOW
			select date_sub(now() , interval 30 day); -- DATE BEFORE 30 DAYS FROM NOW
			select date_sub(now() , interval 30 year);-- DATE BEFORE 30 YEARS FROM NOW
            
            select date_ADD(now() , interval 1 week);  -- DATE AFTER  1 WEEK FROM NOW
			select date_ADD(now() , interval 30 day); -- DATE AFTER 30 DAYS FROM NOW
			select date_ADD(now() , interval 30 year);-- DATE AFTER 30 YEARS FROM NOW

    select * from sales_gh where ship_date_dateformat < date_sub(now() , interval 1 week) ;
  -- 3B) DAYS IN BETWEEN 2 DATES 
			SELECT DATEDIFF(ship_date_dateformat,order_date_dateformat ) FROM sales_gh;
  
-- 4) converting string date to dateformat
SELECT STR_TO_DATE('23-feb-14', '%d-%b-%y');  -- 2nd parameter should  be in the format of the 1st parameter

-- 5)FORMATTING DATE 
SELECT order_date, date_format(order_date_dateformat,'%m-%d') FROM sales_gh;

-- 10) create a column and add new calculated value in it
alter table sales_gh 
add column order_date_dateformat  date after order_date;

update sales_gh
set order_date_dateformat = str_to_date(order_date,'%m/%d/%Y')



