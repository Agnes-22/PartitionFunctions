Use [Partition Fuctions]
GO

CREATE TABLE [dbo].[orders]
( 
[orderid] INT,
[orderdate] DATE,
[CustomerName] VARCHAR(100),
[Customercity] VARCHAR(100),
[Orderamount] MONEY
)


use [Partition Fuctions]
go

insert [dbo].[orders] values (216090, CAST(N'1826-12-19' as date) , N'Edward',N'Phonenix',4713.8900)

go

insert [dbo].[orders] values (508220, cast(N'1826-12-09' As date), N'Aria',N'San Francisco', 9832.7200)
go
insert [dbo].[orders] values (271510, cast(N'1902-09-03' As date), N'LAawrance',N'Chicago', 7199.61)
go
insert [dbo].[orders] values (517050, cast(N'1873-07-05' As date), N'Roland',N'Austin', 936.12)
go
insert [dbo].[orders] values (834677, cast(N'1932-09-29' As date), N'Stella',N'San Francisco', 2471.47
)
go
insert [dbo].[orders] values (339137, cast(N'2019-12-26' As date), N'Salvador',N'Columbus', 4275.76)
go
insert [dbo].[orders] values (830492, cast(N'1801-06-05' As date), N'Ernest',N'Houston', 3858.43)
go
insert [dbo].[orders] values (126979, cast(N'1885-05-03' As date), N'Nicholas',N'San Jose', 8624.99)
go
insert [dbo].[orders] values (590451, cast(N'2012-04-20' As date), N'Ray',N'New York', 6377.95)
go
insert [dbo].[orders] values (173941, cast(N'1808-12-16' As date), N'Aaliyah',N'Columbus', 5308.58)
go
insert [dbo].[orders] values (648122, cast(N'1942-02-24' As date), N'Gilbert',N'Columbus', 6427.80)
go
insert [dbo].[orders] values (547728, cast(N'1854-01-20' As date), N'Jorge',N'Austin', 2326.46)
go
insert [dbo].[orders] values (76596, cast(N'1982-05-27' As date), N'Marvin',N'Chicago', 7577.90)
go
insert [dbo].[orders] values (306085, cast(N'1905-06-26' As date), N'Alex',N'Chicago', 6847.66)
go
insert [dbo].[orders] values (764581, cast(N'1790-10-05' As date), N'Jerome',N'Chicago', 1843.83)
go
select * from orders;

select Customercity, 
avg(orderamount) as Avgorderamount,
min(orderamount) as MInOrderAmount,
sum(orderamount) TotalOrderAmount
from [dbo].orders
Group by Customercity;


select Customercity,CustomerName,Orderamount,
avg(orderamount) as Avgorderamount,
min(orderamount) as MInOrderAmount,
sum(orderamount) TotalOrderAmount
from [dbo].[orders];

--group by Customercity;


select Customercity,
avg(orderamount) over(partition by customercity) as Avgorderamount,
min(orderamount) over(partition by customercity) as MInOrderAmount,
sum(orderamount) over(partition by customercity) TotalOrderAmount
from [dbo].[orders];


select Customercity,CustomerName,OrderAmount,
avg(orderamount) over(partition by customercity) as Avgorderamount,
min(orderamount) over(partition by customercity) as MInOrderAmount,
sum(orderamount) over(partition by customercity) TotalOrderAmount
from [dbo].[orders];

select Customercity,CustomerName,OrderAmount,
count(orderid) over(partition by customercity) as CountOfOrders,
avg(orderamount) over(partition by customercity) as Avgorderamount,
min(orderamount) over(partition by customercity) as MInOrderAmount,
sum(orderamount) over(partition by customercity) TotalOrderAmount
from [dbo].[orders];


select Customercity,CustomerName,
Row_number()  over(partition by customercity order by 
OrderAmount DESC) As 'Row Number',
OrderAmount,
count(Orderid) over(partition by customercity) as CountOfOrders,
avg(orderamount) over(partition by customercity) as Avgorderamount,
min(orderamount) over(partition by customercity) as MInOrderAmount,
sum(orderamount) over(partition by customercity) TotalOrderAmount
from [dbo].[orders];

select Customercity,CustomerName,
Row_number()  over(partition by customercity order by 
OrderAmount DESC) As 'Row Number',
Convert(varchar(20), avg(orderamount) over(partition by Customercity 
order by orderAmount Desc rows between current row and 1 following),
1) as Cumulativeavg,
OrderAmount,

count(Orderid) over(partition by customercity) as CountOfOrders,
avg(orderamount) over(partition by customercity) as Avgorderamount,
min(orderamount) over(partition by customercity) as MInOrderAmount,
sum(orderamount) over(partition by customercity) TotalOrderAmount
from [dbo].[orders];


