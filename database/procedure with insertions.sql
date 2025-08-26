select * from student;
exec sp_help student

alter procedure put @Stid int,@Sname varchar(50),@Email varchar(50),@Marks tinyint
as insert into student(StId,Sname,Email,Marks) values(@Stid,@Sname,@Email,@Marks)
--pure programing in database are procedure,Triger and function 
exec put 8,'ee','ee@gmail.com',12



--executnig procedure
exec ab; --recommended
execute ab;


alter procedure ab @eid int,@name varchar(50) output
as
select @name=FirstName from emp where eid=@eid;

declare @d int=11 --input parameter

declare @na varchar(50)
exec ab 101,@na output;--output parametere
print @na

--function in sql
select dbo.myfx(marks) from student;

select * from student;

alter function myfx(@s int)
returns numeric(10,5)
as 
begin
	return @s*0.4
end

select * from emp;

create function tax(@s int,@p float)
returns numeric(10,5)
as 
begin
	return @s*@p
end

declare @t float=0.1
select dbo.tax(sal,@t) from emp;

--merge cammad in sql its a combination of insert update and delete

--Triggers
/*
3 types of trigger
for trigger : prevent insertion 
after trigger : after insertion
instend of trigger : do not allow insertion
*/


create table Demo(
id int primary key,
name varchar(10)
)
insert into Demo values(7,'bb')
select * from demo;

--creation of the trigger
Alter Trigger trgins
on Demo for insert,update,delete
as
print 'KPMG Trigger'

create Trigger trgaft
on Demo after insert
as
print 'After Trigger'

create Trigger trginsof
on Demo instead of insert
as
print 'Connot insert the data '
--in triggers print the values in the trigger to be and apply the a constraint to the trigger 
--


-------------------
/*
INDEXS
type of indexs
2
1. clustered index : physical sorting (can sort the data only onw way)
2. non clustered index: logical sorting  (we can sort the data up to 999)

index improves the performence if we are looking for seek not for scan
when we create primary key always creates  index is alredy created is a clustered index by default 
first create clustered after creatinf not clustered index if we want both the index of table


*/

create table dummy(
	id int)

insert into dummy values(1)

select * from dummy;

select * from demo where name='aa'

create index demon_name_index on Demo(name)--creation of the index

drop index demo.demon_name_index --drop of the index

select * from demo;