-- Remember to create the database first
 --USE Master
 --GO
 --Create database indexDB
 --GO
--use indexDB
--go

 --Step 1) create the datatable----
--create table [tblEmployee]
--(
--	[Id] int primary key,
--	[Name] nvarchar(50),
--	[Salary] int,
--	[Gender] nvarchar(10),
--	[city] nvarchar(50)
--)

-- Step 2) insert test data randomly
--insert into tblEmployee values(3,'John',4500,'Male','New York')
--insert into tblEmployee values(1,'Sam',2500,'Male','London')
--insert into tblEmployee values(4,'Sara',5500,'Female','Tokyo')
--insert into tblEmployee values(5,'Todd',3100,'Male','Toronto')
--insert into tblEmployee values(2,'Pam',6500,'Female','Sydney')

-- Step 3) check inserted data
--select * from tblEmployee

-- Step 4) right now the employees table does not have an index on SALARY column.
-- So, the query engine has to check each and every row in the table, 
-- resulting in a table scan when running this qyery:
----select * from tblEmployee
----where salary > 5000 and salary < 7000

-- Step 5) Creating the helping index
----CREATE INDEX IX_tblEmployee_Salary
----ON tblEmployee (SALARY ASC)
-- When performing the same select as before it is now called an Index Seek.

-- Step 6) Check the new index in the Object Explorer or run the Stored Procedure
-- sp_Helpindex tblEmployee

-- Step 7) Create a composite clustered index on the Gender and Salary columns
----CREATE CLUSTERED INDEX IX_tblEmployee_Gender_Salary
----ON tblEmployee (Gender DESC, Salary ASC)
-- BUT BUT, you cannot do so until you have deleted the one clustered index that
-- currently is on the Id column.
-- So, find the index and mark it in the Object Explorer - and press DELETE.
-- Now, run the  Create Clustered Index command again.

-- Step 8) Check the ordering of the data now by running the select * command again
----select *
----from tblEmployee

-- Step 9) Create a NonClustered Index on the Employee Name
----CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
----ON tblEmployee(Name)


-- NOTE
-- Nr. 1 
-- Only one clustered index per table, but you can have several Non Clustered Indexes

-- Nr. 2
-- Clustered Index is faster than Non Clustered index, because Non Clustered 
-- has to refer back to the index table.

-- Nr 3.
-- Clustered index determines the storage order of rows in the table, 
-- and hence doesn’t require additional disk space, where as a Non Clustered 
-- index is stored separately from the table, 
-- additional storage space is required. 
-- Having tonnes of data in a table reduces disk space…

