
-- Creating SP 
		DELIMITER &&
		create procedure bal_max()
		BEGIN
			select * from bank_details where balance in (select max(balance) from bank_details);
		END &&

-- calling SP
		call bal_max()

-- Creating SP with argument 
		DELIMITER &&
		create procedure sel_edu_job1(in v1 varchar(30) , in v2 varchar(30) ) 
		BEGIN
			select * from bank_details where education = v1 and job = v2;
		END &&

-- calling SP
		call sel_edu_job1('tertiary' , 'retired');

-- creating Views
create view bank_view as select age , job , marital , balance , education from bank_details; 

select  avg(balance) from bank_view where job = 'admin.'