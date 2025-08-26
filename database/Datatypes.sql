--Data types

create table TextData(
	c1 char(10),--
	c2 varchar(10),
	c3 nchar(10), -- diff bertween char and nchar
	--used nchar store data in the form of unicode so uses 2 bytes for each charcter if the  (so it we can store diffrenct languges)
	--used char store data in the form of ASIC
	c4 nvarchar(10),
	)

insert into TextData values('A','A','A','A') --10,1,20,2
insert into TextData values('AA','AA','AA','AA')
insert into TextData values(N' ಇ-ಕಾಮರ್ಸ',N' ಇ-ಕಾಮರ್ಸ',N' ಇ-ಕಾಮರ್ಸ',N' ಇ-ಕಾಮರ್ಸ')


select *, len(c1),len(c2),len(c3),len(c4) from TextData

select *, datalength(c1),datalength(c2),datalength(c3),datalength(c4) from TextData