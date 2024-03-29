							/* preperatory code

				create database ineuron
				use ineuron

				create table course2(
				course_id int , 
				course_desc varchar(50),
				course_mentor varchar(60),
				course_price int ,
				course_discount int,
				create_date date,
				user_info varchar(50)  )


				create table course_update(
				course_metor_update varchar(50),
				course_price_update int ,
				course_discount_update int ) */

-- trigger - before insert
				/*
				delimiter //
				create trigger course_before_insert1123
				before insert 
				on course2 for each row
				begin
					declare user_val varchar(50);
					set new.create_date = sysdate();
					select user() into  user_val;
					set new.user_info = user_val;
					insert into ref_course values(sysdate() , user_val);
				end; //
				*/
							/*  preperatory code
				create table ref_course (
				record_insert_date date,
				record_insert_user varchar(50)
				)

				select * from ref_course

				select * from course1
				select user()
				insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)
				value(101,"FSDA","sudhanshu",4000,10)

				select * from course2


				select sysdate() */

-- trigger - before insert
		/*
			delimiter //
			create trigger course_before_insert12
			before insert 
			on course2 for each row
			begin
				declare user_val varchar(50);
				set new.create_date = sysdate();
				select user() into  user_val;
				set new.user_info = user_val;
			end; //
			*/
							/*  preperatory code
			create table test1(
			c1 varchar(50),
			c2 date,
			c3 int)


			create table test2(
			c1 varchar(50),
			c2 date,
			c3 int )


			create table test3(
			c1 varchar(50),
			c2 date,
			c3 int ) 
*/
-- trigger - before insert
		/*
		delimiter //
		create trigger to_update_others
		before insert on test1 for each row 
		begin
			insert into  test2 values("xyz",sysdate(),23354);
			insert into  test3 values("xyz",sysdate(),23354);
		end; //
        
		insert into test1 values ("abc",sysdate(),234234)

							
select * from test1;
select * from test2;
select * from test3;
*/
-- trigger - after insert
	/*
    
			delimiter //
			create trigger to_update_others_table 
			after insert on test1 for each row 
			begin
				update test2 set c1 = 'abc' where c1 = 'xyz';
				delete from test3 where c1 = 'xyz';
			end; //

			insert into test1 values ("krish",sysdate(),90077897)
	*/
-- trigger - after delete
	/*
			delimiter //
			create trigger to_delete_others_table 
			after delete on test1 for each row 
			begin
				insert into test3 values("after delete" , sysdate(), 435456);
			end; //

			select * from test1

			delete from test1 where c1 = 'sudhanshu'
*/

-- trigger - before delete
/*
			delimiter //
			create trigger to_delete_others_before
			before delete on test1 for each row 
			begin
				insert into test3 values("after delete" , sysdate(), 435456);
			end; //
            */

-- trigger - before delete - old
/*
delimiter //
create trigger to_delete_others_before_observation2
before delete on test1 for each row 
begin
	insert into test2(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test1
select * from test2
delete from test1 where c1 = 'abc'
	*/
						
                        /*  preperatory code
				create table test11(
				c1 varchar(50),
				c2 date,
				c3 int)


				create table test12(
				c1 varchar(50),
				c2 date,
				c3 int )


				create table test13(
				c1 varchar(50),
				c2 date,
				c3 int )
                */
-- before - delete - old
		/*
			delimiter //
			create trigger to_delete_others_before_observation3
			before delete on test11 for each row 
			begin
				insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
			end; //

			insert into test11 values("sudh" , sysdate(), 435456);
			select * from test11

			delete from test11 where c1 = 'sudh'

			select * from test12
            */
-- after - delete - old
		/*
		delimiter //
		create trigger to_delete_others_before_observation4
		after delete on test11 for each row 
		begin
			insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
		end; //

		delete from test11 where c1 = 'sudhanshu'
		*/
-- after - update - old
		/* 
		delimiter //
		create trigger to_upate_others
		after update on test11 for each row 
		begin
			insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
		end; //
		select * from test11;

		insert into test11 values("sudh",sysdate(),234354)
		update test11 set c1 = "after update" where c1 = "after delete"
		select * from  test12;
		*/
-- before - update - new 
		/*
		delimiter //
		create trigger to_upate_others_before
		before update on test11 for each row 
		begin
			insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
		end; //

		update test11 set c1 = "insert new" where c1 = "sudh" ;
        */