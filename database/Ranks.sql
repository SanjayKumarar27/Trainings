-- =====================================
-- RANKS AND WINDOW FUNCTIONS IN SQL
-- =====================================

/*
Definitions:
- RANK(): Assigns a unique rank to each row within a partition, with gaps if there are ties.
- DENSE_RANK(): Similar to RANK(), but no gaps in ranking values when there are ties.
- ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
- NTILE(n): Divides the result set into n approximately equal parts and assigns a number to each row.
- Column Alias: Alias names can be used in ORDER BY but not in SELECT in the same query block.
*/

-- Creating a view to show different ranking functions
create view ranks as
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,           -- RANK() function
    row_number() Over(Order by sal Desc) as row_num,  -- ROW_NUMBER() function
    -- ntile() requires a parameter, e.g., ntile(4) Over(...)
    Dense_Rank() Over(Order by sal Desc) as dense_rank -- DENSE_RANK() function
from emp;

-- Selecting records with a specific rank
select * from ranks where dense_rank = 5;

-- =====================================
-- DERIVED TABLES / INLINE VIEWS
-- =====================================
/*
Definition:
- Derived Table (Inline View): A subquery in the FROM clause that acts as a temporary table for the outer query.
- Correlated Subquery: A subquery that refers to columns from the outer query.
*/

-- Example of a derived table (inline view)
select * from (
    select Firstname, sal, Dense_Rank() Over(Order by sal Desc) as dense_rank
    from emp
) ranks
where dense_rank = 5;

-- Example showing multiple ranking functions
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,
    row_number() Over(Order by sal Desc) as row_num,
    Dense_Rank() Over(Order by sal Desc) as dense_rank
from emp;

-- =====================================
-- SQL PROCESSING STEPS
-- =====================================
/*
SQL Compilation Steps:
1. Parsing
2. Execution Plan Generation
3. Execution
*/

-- =====================================
-- VIEWS VS STORED PROCEDURES
-- =====================================
/*
View:
- Stores only the query in the database.
- The query is parsed and executed every time the view is used.

Stored Procedure:
- Stores both the query and its execution plan.
- Parsed and compiled once; execution plan is reused.
- Can accept parameters and contain variables (like functions in programming).
*/

-- Creating a stored procedure
create procedure ab 
as
select * from emp;

-- Altering the procedure to accept a parameter
alter procedure ab @did int
as
select * from emp where did = @did;

-- Creating a view
create view vw as 
select * from emp;

select * from vw;

-- =====================================
-- EXECUTING PROCEDURES
-- =====================================
/*
You can execute a procedure using EXEC or EXECUTE.
*/
exec ab;         -- Recommended
execute ab;
exec ab 11;      -- With parameter-- =====================================
-- RANKS AND WINDOW FUNCTIONS IN SQL
-- =====================================

/*
Definitions:
- RANK(): Assigns a unique rank to each row within a partition, with gaps if there are ties.
- DENSE_RANK(): Similar to RANK(), but no gaps in ranking values when there are ties.
- ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
- NTILE(n): Divides the result set into n approximately equal parts and assigns a number to each row.
- Column Alias: Alias names can be used in ORDER BY but not in SELECT in the same query block.
*/

-- Creating a view to show different ranking functions
create view ranks as
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,           -- RANK() function
    row_number() Over(Order by sal Desc) as row_num,  -- ROW_NUMBER() function
    -- ntile() requires a parameter, e.g., ntile(4) Over(...)
    Dense_Rank() Over(Order by sal Desc) as dense_rank -- DENSE_RANK() function
from emp;

-- Selecting records with a specific rank
select * from ranks where dense_rank = 5;

-- =====================================
-- DERIVED TABLES / INLINE VIEWS
-- =====================================
/*
Definition:
- Derived Table (Inline View): A subquery in the FROM clause that acts as a temporary table for the outer query.
- Correlated Subquery: A subquery that refers to columns from the outer query.
*/

-- Example of a derived table (inline view)
select * from (
    select Firstname, sal, Dense_Rank() Over(Order by sal Desc) as dense_rank
    from emp
) ranks
where dense_rank = 5;

-- Example showing multiple ranking functions
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,
    row_number() Over(Order by sal Desc) as row_num,
    Dense_Rank() Over(Order by sal Desc) as dense_rank
from emp;

-- =====================================
-- SQL PROCESSING STEPS
-- =====================================
/*
SQL Compilation Steps:
1. Parsing
2. Execution Plan Generation
3. Execution
*/

-- =====================================
-- VIEWS VS STORED PROCEDURES
-- =====================================
/*
View:
- Stores only the query in the database.
- The query is parsed and executed every time the view is used.

Stored Procedure:
- Stores both the query and its execution plan.
- Parsed and compiled once; execution plan is reused.
- Can accept parameters and contain variables (like functions in programming).
*/

-- Creating a stored procedure
create procedure ab 
as
select * from emp;

-- Altering the procedure to accept a parameter
alter procedure ab @did int
as
select * from emp where did = @did;

-- Creating a view
create view vw as 
select * from emp;

select * from vw;

-- =====================================
-- EXECUTING PROCEDURES
-- =====================================
/*
You can execute a procedure using EXEC or EXECUTE.
*/
exec ab;         -- Recommended
execute ab;
exec ab 11;      -- With parameter-- =====================================
-- RANKS AND WINDOW FUNCTIONS IN SQL
-- =====================================

/*
Definitions:
- RANK(): Assigns a unique rank to each row within a partition, with gaps if there are ties.
- DENSE_RANK(): Similar to RANK(), but no gaps in ranking values when there are ties.
- ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
- NTILE(n): Divides the result set into n approximately equal parts and assigns a number to each row.
- Column Alias: Alias names can be used in ORDER BY but not in SELECT in the same query block.
*/

-- Creating a view to show different ranking functions
create view ranks as
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,           -- RANK() function
    row_number() Over(Order by sal Desc) as row_num,  -- ROW_NUMBER() function
    -- ntile() requires a parameter, e.g., ntile(4) Over(...)
    Dense_Rank() Over(Order by sal Desc) as dense_rank -- DENSE_RANK() function
from emp;

-- Selecting records with a specific rank
select * from ranks where dense_rank = 5;

-- =====================================
-- DERIVED TABLES / INLINE VIEWS
-- =====================================
/*
Definition:
- Derived Table (Inline View): A subquery in the FROM clause that acts as a temporary table for the outer query.
- Correlated Subquery: A subquery that refers to columns from the outer query.
*/

-- Example of a derived table (inline view)
select * from (
    select Firstname, sal, Dense_Rank() Over(Order by sal Desc) as dense_rank
    from emp
) ranks
where dense_rank = 5;

-- Example showing multiple ranking functions
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,
    row_number() Over(Order by sal Desc) as row_num,
    Dense_Rank() Over(Order by sal Desc) as dense_rank
from emp;

-- =====================================
-- SQL PROCESSING STEPS
-- =====================================
/*
SQL Compilation Steps:
1. Parsing
2. Execution Plan Generation
3. Execution
*/

-- =====================================
-- VIEWS VS STORED PROCEDURES
-- =====================================
/*
View:
- Stores only the query in the database.
- The query is parsed and executed every time the view is used.

Stored Procedure:
- Stores both the query and its execution plan.
- Parsed and compiled once; execution plan is reused.
- Can accept parameters and contain variables (like functions in programming).
*/

-- Creating a stored procedure
create procedure ab 
as
select * from emp;

-- Altering the procedure to accept a parameter
alter procedure ab @did int
as
select * from emp where did = @did;

-- Creating a view
create view vw as 
select * from emp;

select * from vw;

-- =====================================
-- EXECUTING PROCEDURES
-- =====================================
/*
You can execute a procedure using EXEC or EXECUTE.
*/
exec ab;         -- Recommended
execute ab;
exec ab 11;      -- With parameter-- =====================================
-- RANKS AND WINDOW FUNCTIONS IN SQL
-- =====================================

/*
Definitions:
- RANK(): Assigns a unique rank to each row within a partition, with gaps if there are ties.
- DENSE_RANK(): Similar to RANK(), but no gaps in ranking values when there are ties.
- ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
- NTILE(n): Divides the result set into n approximately equal parts and assigns a number to each row.
- Column Alias: Alias names can be used in ORDER BY but not in SELECT in the same query block.
*/

-- Creating a view to show different ranking functions
create view ranks as
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,           -- RANK() function
    row_number() Over(Order by sal Desc) as row_num,  -- ROW_NUMBER() function
    -- ntile() requires a parameter, e.g., ntile(4) Over(...)
    Dense_Rank() Over(Order by sal Desc) as dense_rank -- DENSE_RANK() function
from emp;

-- Selecting records with a specific rank
select * from ranks where dense_rank = 5;

-- =====================================
-- DERIVED TABLES / INLINE VIEWS
-- =====================================
/*
Definition:
- Derived Table (Inline View): A subquery in the FROM clause that acts as a temporary table for the outer query.
- Correlated Subquery: A subquery that refers to columns from the outer query.
*/

-- Example of a derived table (inline view)
select * from (
    select Firstname, sal, Dense_Rank() Over(Order by sal Desc) as dense_rank
    from emp
) ranks
where dense_rank = 5;

-- Example showing multiple ranking functions
select Firstname, sal,
    Rank() Over(Order by sal Desc) as rank,
    row_number() Over(Order by sal Desc) as row_num,
    Dense_Rank() Over(Order by sal Desc) as dense_rank
from emp;

-- =====================================
-- SQL PROCESSING STEPS
-- =====================================
/*
SQL Compilation Steps:
1. Parsing
2. Execution Plan Generation
3. Execution
*/

-- =====================================
-- VIEWS VS STORED PROCEDURES
-- =====================================
/*
View:
- Stores only the query in the database.
- The query is parsed and executed every time the view is used.

Stored Procedure:
- Stores both the query and its execution plan.
- Parsed and compiled once; execution plan is reused.
- Can accept parameters and contain variables (like functions in programming).
*/

-- Creating a stored procedure
create procedure ab 
as
select * from emp;

-- Altering the procedure to accept a parameter
alter procedure ab @did int
as
select * from emp where did = @did;

-- Creating a view
create view vw as 
select * from emp;

select * from vw;

-- =====================================
-- EXECUTING PROCEDURES
-- =====================================
/*
You can execute a procedure using EXEC or EXECUTE.
*/
exec ab;         -- Recommended
execute ab;
exec ab 11;      -- With parameter