
	-- creating and calling UDF 
		DELIMITER $$
		create function final_profits(profit int , discount int )
		returns int
		Deterministic
		Begin 
		Declare final_profit int ;
		set final_profit = profit - discount ;
		return final_profit;
		end $$

		select profit, discount , final_profits(profit, discount) 
        from sales.sales3 ; 

-- eg 2: with decimal datatype
	DELIMITER $$
		create function final_profits_real(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6) )
		returns int
		Deterministic
		Begin 
		Declare final_profit int ;
		set final_profit = profit - sales * discount ;
		return final_profit;
		end $$

		select profit, discount  ,sales ,  final_profits_real(profit, discount,sales) from sales.sales3  ; 
       

	-- UDF with if else 
		 DELIMITER &&
		create function mark_sales2(sales int ) 
		returns varchar(30)
		DETERMINISTIC
		begin 
			declare flag_sales varchar(30); 
				if sales  <= 100  then 
					set flag_sales = "super affordable product" ;
				elseif sales > 100 and sales < 300 then 
					set flag_sales = "affordable" ;
				elseif sales >300 and sales < 600 then 
					set flag_sales = "moderate price" ;
				else 
					set flag_sales = "expensive" ;
				end if ;
			return flag_sales;
		end &&

		select sales , mark_sales2(sales ) from sales1 ; 
 

 -- UDF with loop
		create table loop_table(val int)
			Delimiter $$
			create procedure insert_data()
			Begin
			set @var  = 10 ;
				generate_data : loop
					insert into loop_table values (@var);
					set @var = @var + 1  ;
						if @var  = 100 then 
							leave generate_data;
						end if ;
				end loop generate_data;
			End $$

			call insert_data();

			select * from loop_table
            