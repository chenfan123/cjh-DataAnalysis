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

# 10. 创建数据表
create table 表名 (
    字段名 数据类型 [约束],
);
create table user (
    `id` int primary key auto_increment, # 主键，自动递增
    `name` varchar(20) collate utf8_unicode_ci default null, # 默认值为 null
    `age` int not null, # 非空
    `email` varchar(50) not null, # 非空
    `created_at` datetime not null, # 非空
    `updated_at` datetime not null # 非空
);

# 11. 查看已有表
show tables;

# 12. 查看指定数据表的结构
desc 表名;

# 13. 修改指定表的名字
rename table 原表名 to 新表名;

# 14. 删除指定的数据表
drop table 表名;

/*
数据类型：
整数：tinyint smallint mediumint int bigint
    tinyint: 1 byte,范围 -128 ~ 127
    smallint: 2 bytes,范围 -2^15 ~ 2^15-1
    mediumint: 3 bytes,范围 -2^15 ~ 2^15-1
    int: 4 bytes,范围 -2^31 ~ 2^31-1
    bigint: 8 bytes,范围 -2^63 ~ 2^63-1

小数：decimal double float
    decimal: 高精度小数decimal(10,2) 表示10位数，2位小数，总共12位数
    double: 双精度小数
    float: 单精度小数

字符串：varchar char text
    varchar: 可变长度字符串 
    char: 固定长度字符串
    text: 文本

日期时间：date time datetime
    date: 日期
    time: 时间
    datetime: 日期时间


常见的约束：
    主键 primary key:唯一标识表中的一行记录
    非空 not null: 不能为空
    唯一 unique: 不能重复
    默认 default: 默认值
    自动递增 auto_increment: 自动递增
    外键 foreign key: 外键约束
    唯一索引 unique index: 唯一索引
    主键索引 primary key index: 主键索引
    外键索引 foreign key index: 外键索引
    唯一索引 unique index: 唯一索引
    主键索引 primary key index: 主键索引

    单表约束
        primary key 主键约束，非空 唯一 一般结合auto_increment使用
        not null 非空约束，不能为空
        unique 唯一约束，不能重复
        default 默认约束，默认值

    多表约束
    foreign key 外键约束，一般结合主键使用
*/

# 15. 添加表字段
alter table 表名 add 字段名 数据类型 [约束];

# 16. 修改、删除表字段
alter table 表名 change 原字段名 新字段名 数据类型 [约束]; # 即修改字段名和数据类型
alter table 表名 modify 字段名 数据类型 [约束]; # 只修改字段类型

# 17. 删除表字段
alter table 表名 drop 字段名;

