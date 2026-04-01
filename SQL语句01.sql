/*
 DDL: 数据定义语言，用来定义数据库中表的结构
    create  创建
    drop  删除
    alter  修改
    show  查看
*/
/*
    DML: 数据操作语言，用来对数据库中表的记录进行更新.增删改
    insert 插入记录
    delete 删除记录
    update 更新记录
*/
/*
    DQL: 数据查询语言，用来查询数据库中表的记录
    select 查询记录
    from 表名
    where 条件
*/
/*
    DCL: 数据控制语言，用来定义数据库的访问权限和安全级别，及创建用户
    grant 授予权限
    revoke 撤销权限
    create user 创建用户
    drop user 删除用户
    create role 创建角色
    drop role 删除角色
*/

# 1. 查看本机安装的所有数据库
show databases;

# 2. 创建数据库
create database 数据库名;

# 2.1 当数据库不存在时，创建数据库
create database if not exists 数据库名;

# 2.2 创建数据库时，指定数据库的编码方式
create database 数据库名 character set 编码方式;

# 3. 删除数据库
drop database 数据库名;

# 4. 使用数据库
use 数据库名;

# 5. 修改数据库的编码方式
alter database 数据库名 character set 编码方式;

# 6. 查看当前使用的数据库
select database();

# 7. 查看当前数据库的所有表
show tables;

# 8. 查看当前数据库的所有表的结构
show create table 表名;

# 9. 查看当前数据库的所有表的结构
show create table 表名;