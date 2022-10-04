-- windows row number where entire data is a window (no group by)
		select student_id , student_batch , student_stream,students_marks ,
		row_number() over(order by students_marks) as 'row_number' from ineuron_students;

-- windows row number where data is grouped  ( partition by works like group by )	
		select student_id , student_batch , student_stream,students_marks ,
		row_number() over(partition by student_batch order by students_marks desc) as 'row_num' 
		from ineuron_students ;

-- windows - getting the first rank
		select * from (select student_id , student_batch , student_stream,students_marks ,
		row_number() over(partition by student_batch order by students_marks desc) as 'row_num' 
		from ineuron_students ) as test where row_num = 1;

-- windows - rank
		select student_id , student_batch , student_stream,students_marks ,
		row_number() over(order by students_marks desc) as 'row_number',
		rank() over(order by students_marks desc ) as 'row_rank' 
		from ineuron_students ;

-- windows - rank with partition
		select * from (select student_id , student_batch , student_stream,students_marks ,
		row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
		rank() over(partition by student_batch order by students_marks desc ) as 'row_rank' 
		from ineuron_students ) as test where row_rank = 1;

-- windows - row number, rank and dense rank with partition
		select * from (select student_id , student_batch , student_stream,students_marks ,
		row_number() over(partition by student_batch order by students_marks desc) as 'row_number',
		rank() over(partition by student_batch order by students_marks desc ) as 'row_rank',
		dense_rank() over( partition by student_batch order by students_marks desc) as 'dense_rank'
		from ineuron_students ) as test where `dense_rank` = 3
