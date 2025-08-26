(
--Intergrity contraints

/* 
1. Primary key: its not null (not null + unique)
2.Not NULL
3.Unique +( null this allows only one null only in squel server oracel server server allows this )
4.Foreign Key 
5.check 
default


refrential intergrity :Foreign ,primary
entity integrity : Primary
domain integrity :Foreign 

foregin key types 
cascade :delete in both primary and foregin key tables 

set NUll/ set default can be given to set default values

restrict ->default


constraint can be applied column level(StId int primary key) and 
and table level" primary key(StId)"

Sql Server Data type categoris


String ->char,varchar,nchar,nvarchar

char ->fixed length character (default 1 for both)

varchar -> variable length character + 2 for storing the length of the varchar string

Exact Numeric
->
tinyint
smallint
int
bit
decimal/numeric
money 
smallmoney

Approximate  numeric
->
float(n)
real


Binary string data types(image,vedios,pdf,content) can be stored in these tyeps the data types
->
binary(n)
varbinary(n)
varbinary(Max)





*/


create table student(
	StId int primary key,--column level
	Sname varchar(100) not null,
	Email varchar(100) unique,
	Marks tinyint check( Marks between 0 and 100),
	Country varchar(50) default 'India'

	)

Select * from student;


insert into Student  values(1,'add','add@kpmg.com',75,default)

insert into Student (StId,Sname,Email,Marks) values(2,'acc','acc@kpmg.com',76

insert into Student  values(3,'ccc','ccc@kpmg.com',15,default)

insert into Student (Sname,StId) values('ddd',4)
insert into Student (Sname,StId,Email) values('ddd',5,'ddd@kpmg.com')

insert into Student (Sname,StId) values('ddd',null)


create table issueBook(
	Tid int identity primary key,
	Bid int,
	Email  varchar(100) references Student(Email) ,
	-- foregin key(Stid references Student(StId)

	)

drop table issueBook;


select * from issueBook
select * from Student

insert into issueBook values(2,'')

Alter table issueBook Add Constraint Fk_issueBook Foreign key (Stid) references Student(StId) on Delete Set null;
Alter table issueBook Drop Constraint Fk_issueBook

delete from student where Stid=3;

create table abc(
 pan char(10)
 )

 select * from abc;

 insert into abc values('hai')