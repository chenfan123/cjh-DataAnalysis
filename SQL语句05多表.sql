/*
主表是主键表，从表是外键表
什么是外键？
    A表的某一列引用了B表的主键列，A表中的这个列就叫A表的外键
外键约束有什么用？
    保证插入数据的准确性
    保证删除数据的完整性
多对多建表原则：
    新建中间表，该表至少有3列，第一列卫主键列，其他2列充当外键列
    分别去关联多的两方的主键列
*/
# 外键约束设置： constraint 约束名 foreign key (外键列) references 主表名(主键列);
# demo
create table category {
    cid     varchar(10) primary key,
    cname   varchar(20) not null,
}
create table products {
    pid     varchar(10) primary key,
    pname   varchar(20) not null,
    price   decimal(10,2) not null,
    category_id varchar(10) not null,
    # [constraint 约束名] foreign key (外键列) references 主表名(主键列);
    constraint fk_category_id foreign key (category_id) references category(cid),
}

# 查看表的约束
show create table 表名;
# 删除外键约束
alter table 表名 drop foreign key 约束名;

# 建表后添加外键约束，前提:表数据之间必须是合法的
# alter table 外表名 add constraint 约束名 foreign key (外键列) references 主表名(主键列);

# 笛卡尔积（交叉链接）
## 也叫无条件连接，将左表的每一行数据无差别和右表的每一行数据分别进行关联，组成新的数据。会产生大量的脏数据，一般不用。a的总数*b的总数=笛卡尔积的结果
### 语法：select * from 表1 join 表2; 或 select * from 表1，表2;


# 有条件连接
## 在实际表数据连接的过程中，经常需要在连接时跟上一个限制的连接条件，满足条件的数据行才能进行连接，这就是有条件连接。
### 语法：select * from 表1 join 表2 on 连接条件;

/*
对于有条件连接，分为4种不同的连接方式
内连接：inner join
左连接：left join
右连接：right join
全连接：full join

内连接：
    语法：select * from 表1 inner join 表2 on 连接条件;
    语法2:select * from 表1,表2 where 关联条件;
    作用：只返回满足连接条件的行
    特点：返回的结果是两表的交集

左连接：
    语法：select * from 表1 left join 表2 on 连接条件;
    作用：返回左表的全部数据，以及右表中满足连接条件的行
    特点：返回的结果是左表的全部数据，以及右表中满足连接条件的行

右连接：
    语法：select * from 表1 right join 表2 on 连接条件;
    作用：返回右表的全部数据，以及左表中满足连接条件的行
    特点：返回的结果是右表的全部数据，以及左表中满足连接条件的行

全连接：
    语法：select * from 表1 full join 表2 on 连接条件;
    作用：返回两表的全部数据
    特点：返回的结果是两表的全部数据，mysql数据库不支持全连接，需要将左连接和右连接的结果利用union关键字组合实现全连接的效果。
*/
select 
    c.id as cid, 
    c.name as cname, 
    p.id as pid, 
    p.name as pname, 
    p.price as pprice 
from 
    category c # 左表
inner join 
    products p # 右表
on 
c.id = p.category_id; # 左表的每一行尝试和右表的每一行进行连接时，满足连接条件才能关联，否则不能连接
