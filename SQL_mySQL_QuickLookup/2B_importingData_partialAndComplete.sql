use `dress_data` ;

-- when you wanted to load all the columns
LOAD DATA INFILE  
'C:/Ren/learnings/mySQL/My_sql_In/AttributeDataSet_demo.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

-- when you want to load only limited columns
LOAD DATA INFILE  
'C:/Ren/learnings/DA_DS_projects/SQL projects for DA/UK Road Safty Accidents 2015/datasets/Accidents_2015.csv'
into table accident
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS
(@col1, @dummy, @dummy, @dummy, @dummy, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy)
SET accident_index=@col1, accident_severity=@col2;