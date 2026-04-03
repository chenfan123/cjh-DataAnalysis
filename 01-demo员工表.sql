create database employee_db;

use employee_db;

create table employee (
    id int primary key auto_increment, # 员工标识，自增
    name varchar(20) not null, # 员工姓名，非空
    mobile varchar(11) unique not null, # 员工手机号，非空
    email varchar(50) not null, # 员工邮箱，非空
    age int not null, # 员工年龄，非空
    gender varchar(10) not null, # 员工性别，非空
    address varchar(100) not null default '未知', # 员工地址，非空
    salary decimal(10,2) not null, # 员工工资，非空 
    department varchar(20) not null, # 员工部门，非空
    created_at datetime not null, # 创建时间，非空
    updated_at datetime not null # 更新时间，非空
);

insert into employee (name, mobile, email, age, gender, address, salary, department, created_at, updated_at) values ('张三', '13800138000', 'zhangsan@example.com', 20, '男', '北京', 10000.00, '技术部', now(), now());