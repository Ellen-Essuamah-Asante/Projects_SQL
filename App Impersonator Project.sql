# Think about your favorite apps, and pick one that stores your data- like a game that stores scores, an app that lets you post updates, etc. 
# Now in this project, you're going to imagine that the app stores your data in a SQL database (which is pretty likely!), and write SQL statements 
# That might look like their own SQL.

## Salary Calculation App ##

## creating DataBase (i.e salary_payment_app)
CREATE DATABASE salary_payment_app;
USE salary_payment_app;

# Creating Table (i.e workers)
CREATE TABLE  workers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    age INTEGER,
    department TEXT,
    gender TEXT,
	address TEXT(40));
    
# Adding Data into Table (i.e workers)
INSERT INTO workers (name,age,department,gender,address) VALUES ("Keren-Happuch Adu Yeboah", 45, "Data Engineering","Female", "Nungua");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Richard Gidi", 38, "Data Science","Male","Santor");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Laura Eyi Kartey", 31,"Data Analysis","Female" ,"Haatso");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Isaac Annan", 61, "Data Science","Male","Winneba" );
INSERT INTO workers (name,age,department,gender,address) VALUES ("Susana Ama  Gatogo Abban", 33, "Data Engineering","Female","Ablekuma");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Rabiatu Ibrahim", 38, "Data Science","Female","Madina");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Dannette Kwanyo Zotorvie", 20,"Data Engineering", "Female","Tema");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Quartey Phoebe", 22, "Accounting","Female","West Legon");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Ellen Essuamah Asante", 33, "Data Engineering","Male","Madina");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Napoleon Quartey-Papafio", 38, "Accounting","Male","Osu");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Samuel Osei Boadu", 20,"Marketing","Female","Kasoa");
INSERT INTO workers (name,age,department,gender,address) VALUES ("Firdaus Mohammed", 22, "Data Science","Female","Gbawe Topbase");    

# Creating Table (i.e quality_of_work)   
CREATE TABLE quality_of_work (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    days_worked INTEGER,
	hrs_worked INTEGER,
    task_status TEXT);
    
# Adding Data into Table (i.e quality_of_work)
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (20, 10,"Completed");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (15, 8,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (8, 8,"Completed");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (27, 10,"Completed");   
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status)VALUES (25, 5,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (17, 5,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (18, 10,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (12, 8,"Completed");  
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (13, 7,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (15, 7,"Completed");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (15, 6,"Pending");
INSERT INTO quality_of_work (days_worked, hrs_worked,task_status) VALUES (25, 12,"Pending");          

# Creating Table (i.e task)
CREATE TABLE  task (
id INTEGER PRIMARY KEY 
AUTO_INCREMENT,name TEXT,
name_of_task TEXT,
hrs_assigned INTEGER);

# Adding Data into Table (i.e task_deadline)
INSERT INTO task(name,name_of_task,hrs_assigned) VALUES ("Keren-Happuch Adu Yeboah","Data and information visualization", 12  );
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Richard Gidi","Clean dataset", 10  );
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Laura Eyi Kartey","Analysing data to identify trends", 4  );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Isaac Annan","Data preparation", 15  );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Susana Ama  Gatogo Abban","Creating reports", 6  );
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Rabiatu Ibrahim","Maintaining databases, dashboards, and reporting software", 12  );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Dannette Kwanyo Zotorvie","Creating dashboards and reports", 8  );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Quartey Phoebe","Interpret data ", 6 );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Ellen Essuamah Asante","Data exploration" , 8 );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Napoleon Quartey-Papafio","Developing and implementing data policies", 6  );
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Samuel Osei Boadu","Designing databases", 7  );  
INSERT INTO task (name,name_of_task,hrs_assigned) VALUES("Firdaus Mohammed","Overseeing data quality control", 12  );     
           
           
# Viewing Created Tables
SELECT * FROM task;
SELECT * FROM workers;
SELECT * FROM quality_of_work;

# Counting Unique Data Entries
SELECT count(DISTINCT address),
	count(name) as total_workers,
    count(DISTINCT department)
FROM workers;

# Minimum Worker Age
SELECT min(age) 
as MIN_AGE 
FROM workers;

# Maximum Worker Age
SELECT max(age) 
as Max_AGE 
FROM workers;

# Maximum Hours Assigned 
SELECT MAX(hrs_assigned) 
AS 'MAX HRS ASSIGNED' 
FROM task;

# Minimum Hours Assigned
SELECT MIN(hrs_assigned) 
AS 'MIN HRS ASSIGNED' 
FROM task;

# How Many Workers Are In Data Engineering Department And Stays In Ablekuma
SELECT name,department,address 
FROM workers 
WHERE department = 'Data Engineering' 
AND address = 'Ablekuma';

# What Is The Average Hours Each Department Finishes A Task
SELECT department, 
avg(hrs_worked) 
AS avg_hours_to_finish
FROM quality_of_work
JOIN workers ON quality_of_work.id = workers.id
WHERE task_status = 'Completed'
GROUP BY department;


# What Is The Average Salary To Be Paid For Each Department
SELECT a.department,
avg(hrs_worked * 13.53 * days_worked) 
AS AVERAGE_SALARY
FROM workers a
JOIN quality_of_work 
ON a.id = quality_of_work.id 
JOIN workers b
ON b.id = quality_of_work.id
GROUP BY department;



# Maximum Salary of Workers
SELECT a.department,MAX(hrs_worked * 13.53 * days_worked) 
AS MAX_SALARY
FROM workers a
JOIN quality_of_work 
ON a.id = quality_of_work.id 
JOIN workers b
ON b.id = quality_of_work.id
GROUP BY department;

# Minimum Salary of Workers
SELECT a.department,MIN(hrs_worked * 13.53 * days_worked) 
AS MIN_SALARY
FROM workers a
JOIN quality_of_work 
ON a.id = quality_of_work.id 
JOIN workers b
ON b.id = quality_of_work.id
GROUP BY department;

# Hours Assigned And Hours Worked Per Worker
SELECT c.name, c.hrs_assigned, a.hrs_worked
FROM quality_of_work a
JOIN task c ON a.id = c.id
JOIN quality_of_work b ON b.id = c.id
GROUP BY c.name, c.hrs_assigned, a.hrs_worked;

# Name Of Worker ,Task And Department
SELECT a.name, a.department, c.name_of_task
FROM workers a
JOIN task c 
ON a.name = c.name;


# Quality Of Work And Min Salary
SELECT * # a.name,min(b.hrs_worked) * 13.53  AS MIN_SALARY
FROM workers a
JOIN quality_of_work b
ON a.id = b.id
JOIN workers c
ON b.id = c.id;

# Updating/editing data
# Use an UPDATE to emulate what happens when you edit data in the app
UPDATE task SET name_of_task = 'Data exploration' WHERE id = 1;

# Deleting data
# Use a DELETE to emulate what happens when you delete data in the app.
DELETE FROM workers WHERE id = 9;
DELETE FROM task WHERE id = 9;
DELETE FROM quality_of_work WHERE id = 9;


# Viewing Tables
SELECT * FROM workers;
SELECT * FROM task;
SELECT * FROM quality_of_work;

