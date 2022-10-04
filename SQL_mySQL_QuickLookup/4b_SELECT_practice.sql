select * from  bank_details;

-- Try to find out avarage of balance 
select avg(balance) from  bank_details;

-- try to find out who is having a min balance 
select * from  bank_details order by balance asc;
select min(balance) from  bank_details;

-- try to find out who is having a mazxmim balance 
select * from  bank_details order by balance desc LIMIT 1;

-- try to prepare a list of all the person who is having loan 
select * from  bank_details where loan='yes';

-- try to find out average balance for all the people whose job role is admin 
select avg(balance) from  bank_details where job like'%admin%';

-- try to find out a record  without job whose age is below 45 
select * from  bank_details where age<45 and job ='unknown'; 

-- to find out a record where education is primarty and person is jobless
select * from  bank_details where education ='primary' and job ='unknown';

-- try to find of a record whose bank account is having a negative balance 
select * from  bank_details where balance <0;

-- try to find our a record who is not having house at all along with there balance 
select *, balance from  bank_details where housing ='no'