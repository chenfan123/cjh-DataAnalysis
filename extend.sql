# DML
# 01. 不指定字段插入，一次性插入一行，并且指定所有咧
insert into 表名 values (值1, 值2, 值3, ...);

# 02. 指定字段插入，一次性插入一行，并且指定部分字段
insert into 表名 (字段1, 字段2, 字段3, ...) values (值1, 值2, 值3, ...);

# 03. 批量插入，一次性插入多行，并且指定所有字段
insert into 表名 values (值1, 值2, 值3, ...), (值1, 值2, 值3, ...), (值1, 值2, 值3, ...);

# 04. 批量插入，一次性插入多行，并且指定部分字段
insert into 表名 (字段1, 字段2, 字段3, ...) values (值1, 值2, 值3, ...), (值1, 值2, 值3, ...), (值1, 值2, 值3, ...);

# 05. 查看全表数据
select * from 表名;

# 06. 更新所有行
update 表名 set 字段1 = 值1, 字段2 = 值2, 字段3 = 值3, ...;

# 07. 更新满足条件的行
update 表名 set 字段1 = 值1, 字段2 = 值2, 字段3 = 值3, ... where 条件;

# 08. 删除表中满足条件的数据
delete from 表名 where 条件;

# 09. 删除表中的所有数据，主键自增序列不清零
delete from 表名;

# 10. 清空表数据，主键自增序列清零
truncate table 表名;

# 扩展：备份数据表
# 备份表不存在时，创建备份表
create table 备份表名 select * from 原表名;

# 备份表存在时，删除备份表
drop table if exists 备份表名;
 
# 备份表存在，备份数据
insert into 备份表名 select * from 原表名;


/*
DDL数据约束进阶
主键约束
    primary key: 主键约束，确保列中的数据是唯一的，不允许重复
其他约束
*/
# 创建表时设置主键
create table 表名 (
    id int primary key,
    name varchar(20)
);

# 创建表时设置主键，并指定主键列
create table 表名 (
    id int,
    name varchar(20),
    primary key (id)
);

# 删除主键约束
alter table 表名 drop primary key;

# 建表后添加主键约束，结合自增
alter table 表名 add primary key (id);