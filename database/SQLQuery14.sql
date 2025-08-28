
--inbuilt
--upper and lower,isnull,colase,substring,year

select FirstName, upper(substring(LastName,1,1))+LOWER(SUBSTRING(LastName,2,len(LastName))),LastName  from emp;
select * from emp where year(doj) ='2014';

select * from emp;

--function in sql

