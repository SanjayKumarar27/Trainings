select * from emp;

--colmn alias
/*
collation 
CS-case sensitive
CI-case insensitive
	
AS-acent sensitive
AI-acent insensitive
*/
select LastName  LN,FirstName FN from mp;
select LN=LastName,FN=FirstName from emp;
select LastName  as LN,FirstName as FN from emp;

--table alias

select e.LastName,e.FirstName from emp as e;
select e.LastName,e.FirstName from emp;


select * from emp where sal>=25000

select * from emp where EID=101 or EID=105


select * from emp where EID in(101,105,107)


select * from emp where FirstName collate latin1_general_cs_as ='sunil'

select * from emp where FirstName Like 'A%' -- for the names starting with the 

select * from emp where FirstName Like '_A%' -- for the names with second char with A/a

select * from emp where FirstName Like 'A%' or FirstName Like 'B%'

select * from emp where FirstName Like '[AB]%'

select * from emp where FirstName not Like '[AB]%'

select * from emp where FirstName Like '[^AB]%'

create table txt(
	t1 varchar(100)
)

insert into txt values('Hello Word')

insert into txt values('Hello%Word')
insert into txt values('Hello%W')


select * from txt;

select * from txt where t1 like '%[%]%'
--or
select * from txt where t1 like '%!%%' escape '!';



/* physical sequence
select 5
From 1
where 2
Group by 3
Having 4
order by 6

logical sequence
from
where
group by -> used to aggregation functions like (sum,min,max)
having
select
order by

*/

select * from emp;

select DID as Department_Id,count(DID) as No_Of_Empoyees  from emp group by DID;
 
select DID,count(*) as emp_no,COUNT_BIG(*),min(sal),avg(sal),max(sal),sum(sal) from emp 
group by DID 
having count(DID) >2;


select count(DID) from emp; --agregate function dont work wiht nulls

select avg(Comm) from emp; --avg of only empyee getting commison not the onw woth the null

select (sum(Comm)/count(*)) as commison_avg from emp;

select avg(isnull(Comm,0)) from emp; --this works as above

select Comm,isnull(Comm,0) from emp; -- proff for above

select Comm,coalesce(Comm,0) from emp; -- proff for above

--coalase has levele= dififnation where first option is null we can go with other option 

select Comm,mid,sal,coalesce(comm,mid,sal,0) from emp;

select * from emp;

select EID,sal,Comm,(sal + isnull(Comm,0)) as tatol_income from emp;


/* Group by advance
grouping sets -weare making the sets 
group by roll up lesser combination
group cube - more combinations
*/
select did ,count(sal) from emp group by did;

select jobs, count(sal) from emp group by jobs;


select did,jobs,count(sal) from emp group by  grouping sets(did,jobs);


select did,jobs,count(sal) from emp group by  rollup(did,jobs)



select did,jobs,count(sal) from emp group by  cube(did,jobs)


/* order by 
ASC -default
DESC - have to mentions

order by can be used using the 
number of the column in select
alias name
column name


multiple order by colmun can be used if there are duplicate are there in the first column we can order by second column 
by adding ,
*/


select * from emp order by 1 Desc;

--multiple order by colmun can be used if there are duplicate are there in the first column we can order by second column by adding ,

select * from emp  where DID is not null order by DID,sal desc 

select count(distinct did) from emp;

select count(*) from (select DID from emp  where DID is not null group by DID) as e;
-------------------------------------------------------------------------------------------------------------------------------------------\


select * from loc;
--r 5
--c 2

select * from dept; --lid
--r 12
--c 3

select * from emp; --did
--r 12
--c 11

/* inner join - matching data here in employee table we hae 12 emp and department table  5 dept in emp 11 emp have dept name so 11 row willl apper for */--


select FirstName,Dname from emp
inner join dept on emp.DID =dept.DID

--other way to inner join
select FirstName,Dname from emp, dept where emp.did=dept.did;
--other way to inner join
select e.did,e.FirstName,d.Dname from emp e join dept d on e.did=d.did;
--other way to inner join
select FirstName,Dname from emp join dept on emp.did=dept.did;

--sql-92
select FirstName,Dname,City 
from emp
inner join dept 
on emp.DID =dept.DID 
inner join  loc
on dept.lid=loc.lid;

--sql-89
select e.FirstName,d.dname,l.city 
from emp e ,dept d,loc l 
where e.did=d.did and d.lid=l.lid



--outer joins 

--2ways of right outer join
select FirstName,Dname 
from emp 
right outer join dept 
on emp.did=dept.did;-- all right

select FirstName,Dname 
from emp 
right  join dept 
on emp.did=dept.did;-- all right

--2ways of left outer join

select FirstName,Dname 
from emp 
left outer join dept 
on emp.did=dept.did;--all left

select FirstName,Dname 
from emp 
left  join dept 
on emp.did=dept.did;--all left


--2ways of full outer join

select FirstName,Dname 
from emp 
full outer join dept 
on emp.did=dept.did;-- both left and right

select FirstName,Dname 
from emp 
full  join dept 
on emp.did=dept.did;-- both left and right



--emp name with manger name 
--we can do this by self join 

select e1.FirstName ,e2.FirstName as Manegername 
from emp e1
join emp e2 
on e1.MID =e2.EID;

--emp who get more sal than theeir  mgr
select e1.FirstName,e1.sal as emp_sal,e2.sal as mgr_sa
from emp e1
join emp e2 
on e1.MID =e2.EID where e1.sal >e2.sal;

--cocatenation 
select e1.FirstName +' reports to '+e2.FirstName
from emp e1
join emp e2 
on e1.MID =e2.EID;

select CONCAT(FirstName,' gets ',sal) from emp;

select firstname +' gets '+str(sal) from emp;


select firstname +' gets '+ Convert(varchar(100),sal) from emp;


select firstname +' gets '+cast(sal as varchar(100)) from emp;

--unions
create table A( ID int primary key);

create table B( ID int primary key);

insert into A values(1),(5),(9);
insert into B values(2),(5),(7);
drop table A;
select id from A union select id from B;

--union all
select id from A union all select id from B;

 -- - operation as except

 select id from A intersect select id from B;
 

 select * from emp
 select * from emp_history

  select EID from emp 
  intersect 
  select eid from emp_history;
  
  
  select EID,Sal from emp 
  intersect 
  select eid,sal from emp_history;

	  select eid,sal,FirstName from emp 
	  union 
	  select eid,sal,Null  from emp_history;
--default value can be given insted null in this 


  select EID,sal ,FirstName fn from emp 
  union 
  select eid,sal,'No Name' from emp_history order by 2;

  --subquery 

  select FirstName,sal 
  from emp
  where sal > (select sal
				from emp 
				where FirstName='Baskaran');

select FirstName ,sal from emp where sal=(select min(sal) from emp);

select top 1 FirstName,sal from emp order by sal ;

select FirstName,sal
from emp 
order by sal desc 
offset 3 rows 
Fetch next 1 rows only ;


-- emp getting highest salries in theeir departments

select FirstName from emp when sal=max(sal)

select did,count(*) from emp group by did ;


select * from emp order by  did ,sal desc
--Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or 
--when the subquery is used as an expression.
select * from emp where sal in(select max(sal) from emp group by did); 

--coreleated subquery
-- outer query refrence in the inner query this is called the correleted query
--sub query written after from is called  derived query is 

select * from emp e where sal=(select max(sal) from  emp where did=e.did)