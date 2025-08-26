use Sanjay;


create table Demo( ---DDL
	Id int,
	Name varchar(20),
	)

SELECT * FROM Demo;

Insert into  Demo values(2,'bb'); ---recommended

Insert into  Demo values(3,'cc'),(4,'dd'); ---DML


insert into Demo (Name,Id) values('eee',5)---recommended


insert into Demo (Id) values(5) --recommended

update Demo Set Name='fff' where Id=5;---DML

Alter table Demo add phone char(10);---DML

Alter table Demo drop column phone

Delete from Demo where id=1;

Truncate table Demo

Drop table Demo;



