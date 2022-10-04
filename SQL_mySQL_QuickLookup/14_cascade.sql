--  deleting 

		/* cannot delete a record from primary key table if there is a entry in table if there is a secondary key. 
        so first delete child table record then parent*/
        delete from parent where id =1;
		delete from child where id =1;

-- deleting even if there are records in the secondary key table 
	-- delete cascade
		create table child (
		id int ,
		parent_id int ,
		foreign key (parent_id) references parent(id) on delete cascade )