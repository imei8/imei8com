use ExcelToSqlserver
go 
--�ж����ݱ�治����
if exists(select * from sysobjects where [name]='Table_2')
begin
print '����'
--drop table Table_2
end
else
begin
print '������'
end
go

create table MyTable

(
MyId int not null,
name1 varchar(50),
name2 varchar(100)
)
