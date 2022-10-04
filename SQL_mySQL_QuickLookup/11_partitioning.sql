-- Partitioning Types:
		 /*RANGE Partitioning
		 LIST Partitioning
		COLUMNS Partitioning
		 HASH Partitioning
		 KEY Partitioning
		 Subpartitioning*/

-- to verify partitions created 
	select partition_name , table_name , table_rows from information_schema.partitions 
    where table_name = 'ineuron_courses1';

-- RANGE Partitioning
				create table ineuron_courses1(
				course_name varchar(50),
				course_id int(10),
				course_title varchar(60),
				course_desc varchar(80),
				launch_date date,
				course_fee int,
				course_mentor varchar(60),
				course_launch_year int)
				partition by range(course_launch_year)(
				partition p0 values less than (2019),
				partition p1 values less than (2020),
				partition p2 values less than (2021),
				partition p3 values less than (2022),
				partition p4 values less than (2023));

-- partition by hash:	
			create table ineuron_courses2(
			course_name varchar(50),
			course_id int(10),
			course_title varchar(60),
			course_desc varchar(80),
			launch_date date,
			course_fee int,
			course_mentor varchar(60),
			course_launch_year int)
			partition by hash(course_launch_year)
			partitions 5;

-- partition by key
			create table ineuron_courses4(
			course_name varchar(50),
			course_id int(10) primary key ,
			course_title varchar(60),
			course_desc varchar(80),
			launch_date date,
			course_fee int,
			course_mentor varchar(60),
			course_launch_year int)
			partition by key()
			partitions 10;

-- hash algorithm used with key partition
			SELECT MD5('MERN');

-- LIST partitioning
			create table ineuron_courses6(
			course_name varchar(50) ,
			course_id int(10) ,
			course_title varchar(60),
			course_desc varchar(80),
			launch_date date,
			course_fee int,
			course_mentor varchar(60),
			course_launch_year int)
			partition by list(course_launch_year)(
			partition p0 values in(2019,2020),
			partition p1 values in(2022,2021)
			);

--  Column partitioning (range columns)
				create table ineuron_courses8(
				course_name varchar(50) ,
				course_id int(10) ,
				course_title varchar(60),
				course_desc varchar(80),
				launch_date date,
				course_fee int,
				course_mentor varchar(60),
				course_launch_year int)
				partition by range columns(course_name ,course_id,course_launch_year )(
				partition p0 values less than ('aiops',105,2019),
				partition p1 values less than ('fsds' ,110,2021),
				partition p2 values less than ('MERN',116,2023)
				);

--  Column partitioning (list columns - categorical values)

			create table ineuron_courses9(
			course_name varchar(50) ,
			course_id int(10) ,
			course_title varchar(60),
			course_desc varchar(80),
			launch_date date,
			course_fee int,
			course_mentor varchar(60),
			course_launch_year int)
			partition by list columns(course_name)(
			partition p0 values  in('aiops','data analytics','Dl','RL'),
			partition p1 values  in('fsds' ,'big data','blockchain'),
			partition p2 values  in('MERN','java','interview prep','fsda')
			);



-- subpartition
				create table ineuron_courses10(
				course_name varchar(50),
				course_id int(10),
				course_title varchar(60),
				course_desc varchar(80),
				launch_date date,
				course_fee int,
				course_mentor varchar(60),
				course_launch_year int)
				partition by range(course_launch_year)
				subpartition by hash(course_launch_year)
				subpartitions 5 (
				partition p0 values less than (2019) ,
				partition p1 values less than (2020) ,
				partition p2 values less than (2021) ,
				partition p3 values less than (2022) 
				);
