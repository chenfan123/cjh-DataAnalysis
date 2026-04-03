# DQL
/*
    总的格式：
    select
        [distinct] 列名 [as 别名], 列名 [as 别名] ...
        from
            数据表明
        where
            组前筛选
        group by
            分组字段
        having
            组后筛选
        order by
            排序的列1 [asc|desc], 排序的列2 [asc|desc], ...
        limit
            起始索引，数据条数;  
*/
# 简单查询
## 1. 查询表中的全部数据
select * from 表名;

## 2.查询表中的指定列数据
select 列1, 列2, 列3, ... from 表名;

## 3. 查询表中的指定列数据并给结果列起别名
select 列1 as 别名1, 列2 as 别名2, 列3 as 别名3, ... from 表名;

## 4. 查询表中的指定列数据
select 表名.列1, 表名.列2, 表名.列3, ... from 表名;

## 5. 查询表中的指定列数据并给表起别名
select 表名.列1, 表名.列2, 表名.列3, ... from 表名 as 别名;

## 6. 查询数据并修改某列值,然后修改别名，因为修改某列值会把列名也修改，所以需要修改别名
select 列1, 列2, 列3 + 10 as 别名2 from 表名;

# 条件查询
select * from 表名 where 条件;
/*
条件运算符
    1. 比较运算符：=、>、<、>= <= != <>
        !=和<>都是不等于
    2. 逻辑运算符：and、or、not
    3. like模糊查询
        %:表示任意多个任意字符
        _:表示任意一个任意字符
    4. 范围查询
        between 值1 and 值2:表示在某个范围内
        not between and:表示不在某个范围内
        in(值1,值2,值3):表示在某些值 
    5. 空值查询
        is null:表示为空
        is not null:表示不为空
*/
select * from product where price > 1000;
select * from product where price between 1000 and 2000;

# 排序查询,可以根据多列排序，前列值相同的数据，再根据后列值排序
select * from 表名 order by 列1 [asc|desc], 列2 [asc|desc], ...;

# 聚合函数
## count(col)求指定列的总记录数:效率问题：count(主键列)>count(1)>count(列)>count(*)
## max(col)求指定列的最大值
## min(col)求指定列的最小值
## sum(col)求指定列的和
## avg(col)求指定列的平均值
select count(*) from 表名;
select max(price) from 表名;
select min(price) from 表名;
select round(avg(price),2) from 表名; # 四舍五入，保留2位小数
select ceil(avg(price)) from 表名; # 向上取整


# 分组查询 
## 先分组，再聚合；组前筛选用where 组后筛选用having
select 分组字段,聚合函数(列) from 表名 group by 分组字段,... having 分组后筛选;

# 去重查询
## distinct去重,会把字段加起来去重，比如下面这一行会根据字段1+字段2去去重
select distinct 字段1，字段2 from 表;

# 分页查询，m表示开始行索引，默认为0，n表示要查询条数
select 字段列表 from 表名 limit m,n; # 第m+1行开始，往后获取n行内容

