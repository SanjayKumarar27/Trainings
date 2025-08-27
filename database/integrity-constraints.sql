
-- Integrity Constraints in SQL

/*
Definitions:
1. Primary Key: A column (or set of columns) that uniquely identifies each row in a table. It is both NOT NULL and UNIQUE.
2. NOT NULL: Ensures that a column cannot have a NULL value.
3. UNIQUE: Ensures all values in a column are different. (In SQL Server/Oracle, allows only one NULL.)
4. Foreign Key: A column that creates a relationship between two tables, referencing the primary key of another table.
5. CHECK: Ensures that all values in a column satisfy a specific condition.
6. DEFAULT: Assigns a default value to a column if no value is specified.

Types of Integrity:
- Referential Integrity: Ensured by Foreign Key and Primary Key constraints; maintains consistency between related tables.
- Entity Integrity: Ensured by Primary Key; guarantees each row is uniquely identifiable.
- Domain Integrity: Ensured by data types, constraints, and Foreign Keys; restricts the type, format, or range of values.

Foreign Key Actions:
- CASCADE: Automatically deletes or updates matching rows in child table when parent row is deleted/updated.
- SET NULL / SET DEFAULT: Sets the foreign key value to NULL or a default value when the referenced row is deleted.
- RESTRICT: Prevents deletion or update of a referenced row.

Constraint Application:
- Column Level: Constraint defined within the column definition (e.g., StId int PRIMARY KEY).
- Table Level: Constraint defined after all columns are listed (e.g., PRIMARY KEY(StId)).

SQL Server Data Type Categories:
- String: char, varchar, nchar, nvarchar
  - char: Fixed-length character data (default length is 1).
  - varchar: Variable-length character data; uses extra 2 bytes to store length.
- Exact Numeric: tinyint, smallint, int, bit, decimal/numeric, money, smallmoney
- Approximate Numeric: float(n), real
- Binary String: binary(n), varbinary(n), varbinary(MAX)
  - Used to store images, videos, PDFs, and other binary content.
*/

-- Creating student table with various constraints
create table student(
    StId int primary key, -- Primary Key constraint (column level)
    Sname varchar(100) not null, -- NOT NULL constraint
    Email varchar(100) unique, -- UNIQUE constraint
    Marks tinyint check( Marks between 0 and 100), -- CHECK constraint for valid marks
    Country varchar(50) default 'India' -- DEFAULT constraint
)

Select * from student; -- View all records in student table

-- Inserting records into student table
insert into Student values(1,'add','add@kpmg.com',75,default) -- Uses default value for Country

insert into Student (StId,Sname,Email,Marks) values(2,'acc','acc@kpmg.com',76) -- Country will be default 'India'

insert into Student values(3,'ccc','ccc@kpmg.com',15,default)

-- Inserting with only Sname and StId (other columns will be NULL/default if allowed)
insert into Student (Sname,StId) values('ddd',4)
insert into Student (Sname,StId,Email) values('ddd',5,'ddd@kpmg.com')

-- Attempt to insert NULL into primary key (will fail)
insert into Student (Sname,StId) values('ddd',null)

-- Creating issueBook table with foreign key reference to Student(Email)
create table issueBook(
    Tid int identity primary key, -- Auto-increment primary key
    Bid int,
    Email varchar(100) references Student(Email) -- Foreign Key constraint
    -- Foreign key (Stid references Student(StId)) can also be used
)

drop table issueBook; -- Drops the issueBook table

select * from issueBook -- View all records in issueBook
select * from Student -- View all records in student

-- Inserting into issueBook (may fail if Email does not exist in Student)
insert into issueBook values(2,'')

-- Adding and dropping a foreign key constraint on issueBook
Alter table issueBook Add Constraint Fk_issueBook Foreign key (Stid) references Student(StId) on Delete Set null;
Alter table issueBook Drop Constraint Fk_issueBook

-- Deleting a student record (will fail if referenced by issueBook unless ON DELETE SET NULL/CASCADE is set)
delete from student where Stid=3;

-- Creating a simple table for PAN numbers
create table abc(
 pan char(10)
)

select * from abc; -- View all records in abc

insert into abc values('hai') -- Insert values this accepts because char need not be full length but takes full space assigned to it