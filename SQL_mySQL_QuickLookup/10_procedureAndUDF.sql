--Task 
/*1 . Create a loop for a table to insert a record into a tale for two columns in first coumn you have to 
     inset a data ranging from 1 to 100 and in second column you hvae to inset a square of the first column*/
			-- creating table to save data
            create table loop_table1(val int, sqr int)
            
            -- creating procedure 
            USE sales
            DELIMITER &&
			create procedure  squarestable3 (lastnum int)
			Begin
				declare var int default 1;  
				declare square int default 0; -- variable to save the squared value
					generate_data : loop     -- looping till lastnum times 
					insert into loop_table1 values (var,square); 
					set var=var +1;
					set square = var*var;
					if var >lastnum then 
							leave generate_data;
					end if ;
					end loop generate_data ;
				end&&
				
				-- calling the procedure
				call sales.squarestable3(100);
				
				-- verifying data  in the created table 
				select * from loop_table1
            
-- 2 . create a user defined function to find out a date differences in number of days 
 
				DELIMITER $$
					create function diffdates1(date1 datetime, date2 datetime)
					returns int
					DETERMINISTIC
					BEGIN 
						DECLARE diffdatevar int ;
						set diffdatevar = Datediff(date1,date2) ; -- difference between dates 
						return diffdatevar; 
					end $$
			 
			 select * from sales3;
			  -- date difference between order and shipping
			 select diffdates1(ship_date_new, order_date_new) from sales3
 
   -- 3 . create a UDF to find out a log base 10 of any given number 
			DELIMITER $$
					create function log10f(num int)
					returns float
					DETERMINISTIC
					BEGIN 
						DECLARE log10val int ;
						set log10val = log10(num) ; 
						return log10val; 
					end $$
			
			  -- calling log10 UDF
			 select log10f(10) 
             
-- 4 . create a UDF which will be able to check a total number of records avaible in your table 
		DELIMITER $$
					create function totalrecords()
					returns int
					DETERMINISTIC
					BEGIN 
						declare totalcount int default 0;
                        select count(*) into totalcount from sales3;
                        return totalcount;
					end $$
			
			  -- calling count UDF
			 select totalrecords();
-- 5 . create a procedure to find out  5th highest profit in your sales table you dont have to use rank and 
   -- windowing function  -- 4630.47550000
		DELIMITER $$
					create function Nthhighest(N int )
					returns float
					DETERMINISTIC
					BEGIN 
						declare Nthhighest float default 0;
                        declare Nminus1 int ; set Nminus1=N-1;
							select profit INTO Nthhighest from sales3 
							order by profit desc LIMIT Nminus1,1 ; -- using LIMIT pagination capability i.e LIMIT N-1, 1
                        return Nthhighest;
					end $$
			
			  -- calling count UDF
			 select Nthhighest(5);
		
		

      