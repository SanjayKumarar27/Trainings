-- View all records in student table
select * from student;

-- Show table structure and details
exec sp_help student

-- =====================================
-- STORED PROCEDURE: Insert into student
-- =====================================
/*
Definition: 
A stored procedure is a precompiled collection of one or more SQL statements that can be executed as a single unit. 
Used for encapsulating logic, improving performance, and reusability.
these are like functions in programming languages which can be written in sql server
*/
alter procedure put 
    @Stid int,
    @Sname varchar(50),
    @Email varchar(50),
    @Marks tinyint
as 
    insert into student(StId,Sname,Email,Marks) values(@Stid,@Sname,@Email,@Marks)

-- Execute the procedure to insert a record
exec put 8,'ee','ee@gmail.com',12

-- =====================================
-- EXECUTING PROCEDURES
-- =====================================
/*
You can execute a procedure using EXEC or EXECUTE.
*/
exec ab; -- recommended
execute ab;
ab --also this but not recommended

-- =====================================
-- PROCEDURE WITH OUTPUT PARAMETER
-- =====================================
/*
Output parameters allow procedures to return values to the caller.
*/
alter procedure ab 
    @eid int,
    @name varchar(50) output
as
    select @name=FirstName from emp where eid=@eid;

declare @d int=11 -- input parameter
declare @na varchar(50)
exec ab 101,@na output; -- output parameter
print @na

-- =====================================
-- USER-DEFINED FUNCTIONS
-- =====================================
/*
Definition:
A function returns a single value and can be used in SELECT statements.
*/
-- Scalar function to calculate 40% of marks
alter function myfx(@s int)
returns numeric(10,5)
as 
begin
    return @s*0.4
end

select dbo.myfx(marks) from student; --the dbo here is database owner schema

-- Function to calculate tax
create function tax(@s int,@p float)
returns numeric(10,5)
as 
begin
    return @s*@p
end

declare @t float=0.1
select dbo.tax(sal,@t) from emp;

-- =====================================
-- MERGE COMMAND
-- =====================================
/*
Definition:
MERGE is used to perform insert, update, and delete operations in a single statement based on conditions.
*/

-- =====================================
-- TRIGGERS
-- =====================================
/*
Definition:
A trigger is a special kind of stored procedure that automatically executes when an event occurs in the database.
Types of triggers:
1. FOR/AFTER trigger: Executes after the triggering event (insert/update/delete).
2. INSTEAD OF trigger: Executes instead of the triggering event.
*/
create table Demo(
    id int primary key,
    name varchar(10)
)
insert into Demo values(7,'bb')
select * from demo;

-- FOR trigger: Executes for insert, update, delete
Alter Trigger trgins
on Demo for insert,update,delete
as
print 'KPMG Trigger'

-- AFTER trigger: Executes after insert
create Trigger trgaft
on Demo after insert
as
print 'After Trigger'

-- INSTEAD OF trigger: Prevents insertion
create Trigger trginsof
on Demo instead of insert
as
print 'Cannot insert the data '

-- Note: You can print values or apply constraints inside triggers.

-- =====================================
-- INDEXES
-- =====================================
/*
Definition:
An index is a database object that improves the speed of data retrieval operations on a table.
Types of indexes:
1. Clustered index: Sorts and stores the data rows in the table based on the index key. Only one per table.
2. Non-clustered index: Logical order, separate from the data rows. Up to 999 per table.
Notes:
- Indexes improve performance for seek operations, not for scans.
- Creating a primary key automatically creates a clustered index by default.
*/
create table dummy(
    id int
)

insert into dummy values(1)

select * from dummy;

select * from demo where name='aa'

-- Create a non-clustered index on Demo(name)
create index demon_name_index on Demo(name)

-- Drop the index
drop index demo.demon_name_index

select * from demo;