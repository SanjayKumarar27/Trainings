-- ranks

/*
rank
dence rank


column alias is used ony by order by
*/

create view ranks as
select Firstname,sal,
Rank() Over(Order by sal Desc) ,
row_number() Over(Order by sal Desc) ,
ntile() ,
Dense_Rank() Over(Order by sal Desc) as Rank from emp;

select * from ranks where Rank=5;

-- outer query refrence in the inner query this is called the correleted query
--sub query written after from is called  derived query is 

--drived table/inline veiw
select * from (select Firstname,sal,Dense_Rank() Over(Order by sal Desc) as Rank from emp)ranks where Rank=5;


select Firstname,sal,
Rank() Over(Order by sal Desc) as rank ,
row_number() Over(Order by sal Desc)as row_num ,

Dense_Rank() Over(Order by sal Desc) as dense_Rank from emp;


--declareatve and imperative 
-- the steps sql compilate are ->parsing ->execution plan ->execution

---diffrence between veiws and stored procedures

--veiws : only store the query in the data base
--	follow above proceduere evey time we use a veiw

--stored procedure : query which has stored both query and its execution plan
--follow above procedure onlyonce  and store the output where this can be reused 
	--simlar to function here we can also create variables
	--we can pass paramete here


--storing procedures
create procedure ab 
as
select * from emp;

--altering the procedures
alter procedure ab @did int
as
select * from emp where did=@did;


create view vw
as 
select * from emp;

select * from vw;


--executnig procedure
exec ab; --recommended
execute ab;
ab 11;