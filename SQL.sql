use ExcelToSqlserver
go 
--判断数据表存不存在
if exists(select * from sysobjects where [name]='Table_2')
begin
print '存在'
--drop table Table_2
end
else
begin
print '不存在'
end
go

create table MyTable

(
MyId int not null,
name1 varchar(50),
name2 varchar(100)
)
