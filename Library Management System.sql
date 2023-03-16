create database library;
use library;

create table members(member_id varchar(30)not null primary key,member_name varchar(50)not null,city varchar(30),date_register date not null,date_expire date,membership_status varchar(20)not null);

alter table members add name varchar(20);

create table supplier_details(supplier_id varchar(30)not null primary key,supplier_name varchar(30)not null,adress varchar(50),contact bigint(10) not null,email varchar(20)not null);

create table fine_details(fine_range varchar(3) primary key,fine_amount decimal(10,2)not null);

create table book_details(book_code varchar(10) primary key,book_details varchar(30)not null,category varchar(15)not null,author varchar(30)not null,publication varchar(30)not null,publish_date date,price decimal(10,4)not null,rack_num varchar(3),date_arrival date not null,supplier_id varchar(30)not null,foreign key(supplier_id)references supplier_details(supplier_id));

create table book_issue(book_issue_no int primary key,member_id varchar(10)not null,book_code varchar(10)not null,date_issue date not null,date_return date not null,date_returned date not null,fine_range varchar(3),foreign key(member_id)references members(member_id),foreign key(book_code)references book_details(book_code),foreign key(fine_range)references fine_details(fine_range));

insert into members values('001','Sudheesh','Kochi','2012-02-12','2013-02-11','Temporary');
insert into members values('002','Biju','Delhi','2012-04-10','2013-04-09','Temporary');
insert into members values('003','Divya','Bengaluru','2012-05-13','2013-05-12','Permanent');
insert into members values('004','Soja','Chennai','2012-04-22','2013-04-21','Temporary');
insert into members values('005','Krithi','Ahmedabad','2012-03-30','2013-05-16','Temporary');
insert into members values('006','Ajay','Hyderabad','2012-04-12','2013-05-16','Temporary');

select*from members;

insert into supplier_details values('01','Singapore Shopee','Chennai',9894123555,'sing@gmail.com');
insert into supplier_details values('02','Jk stores','Mumbai',9940123450,'jks@yahoo.com');
insert into supplier_details values('03','Rose Book Store','Trivandrum',9444411222,'rose@gmail.com');
insert into supplier_details values('04','Kavari Store','Delhi',8630001452,'kavi@redif.com');
insert into supplier_details values('05','Einsten Book Gallery','US',9542000001,'eingal@aol.com');
insert into supplier_details values('06','Akbar Store','Mumbai',7855623100,'akbarst@aol.com');

select*from supplier_details;

insert into fine_details values('R0',0);
insert into fine_details values('R1',200);
insert into fine_details values('R2',50);
insert into fine_details values('R3',75);
insert into fine_details values('R4',100);
insert into fine_details values('R5',150);
insert into fine_details values('R6',200);

select*from fine_details;

insert into book_details values('BL000001','javaForvDummies','JAVA','Paul J.Deitel','Prentice Hall','1999-12-10',6575,'A1','2011-05-10','01');
insert into book_details values('BL000002','Java:The Complete Reference','JAVA','Herbert Schildt','Tata Mcgraw Hill','2011-10-10',750,'A1','2011-05-10','03');
insert into book_details values('BL000003','Java How To Do Program','JAVA','Paul J.Deitel','Prentice Hall','1999-05-10',6600,'A1','2012-05-10','01');
insert into book_details values('BL000004','Java:The Complete Reference','JAVA','Herbert Schildt','Tata Mcgraw Hill','2011-10-10',5750,'A1','2012-05-11','01');
insert into book_details values('BL000005','Java How To Do Program','JAVA','Paul J.Deitel','Prentice Hall','1999-12-10',6600,'A1','2012-05-11','01');
insert into book_details values('BL000006','Java:The Complete Reference','JAVA','Herbert Schildt','Tata Mcgraw Hill','2011-10-10',5750,'A1','2012-05-12','03');
insert into book_details values('BL000007','Let Us C','C','Yashvant Kanetkar','BPB Publications','2010-12-11',9500,'A3','2010-11-03','03');
insert into book_details values('BL000008','Let Us C','C','Yashvant Kanetkar','BPB Publications','2010-05-12',9500,'A3','2011-08-09','04');
insert into book_details values('BL000009','Let Us C#','C','Yashvant Kanetkar','BPB Publications','2010-05-12',9550,'A3','2011-08-09','04');
insert into book_details values('BL000010','Let Us C++','C','Yashvant Kanetkar','BPB Publications','2010-05-12',9650,'A3','2011-08-09','04');

select*from book_details;

insert into book_issue values(001,'001','BL000001','2012-05-11','2012-05-16','2012-05-16','R0');
insert into book_issue values(002,'002','BL000002','2012-05-01','2012-05-06','2012-05-16','R2');
insert into book_issue values(003,'003','BL000007','2012-04-01','2012-04-16','2012-04-20','R1');
insert into book_issue values(004,'004','BL000005','2012-04-01','2012-04-16','2012-04-20','R1');
insert into book_issue values(005,'005','BL000008','2012-03-30','2012-04-15','2012-04-20','R1');
insert into book_issue values(006,'005','BL000008','2012-04-20','2012-05-05','2012-05-05','R0');
insert into book_issue values(007,'003','BL000007','2012-04-22','2012-05-07','2012-05-25','R4');

select*from book_issue;

alter table members add name varchar(20);

select member_id,member_name,city,membership_status from members where membership_status='Permanent';

select member_id,member_name from members where member_id in(select member_id from book_issue where book_code like '%02');

select book_code,author,book_details from book_details where author like 'p%';

select count(category)no_of_books from book_details where category='JAVA';

select category,count(category)no_of_books from book_details where category='java' or category='C' group by category;

select member_name,member_id,date_register,date_expire from members where date_expire<'2014-04-00';

select concat(book_details," ","Is Written By"," ",author)from book_details;

select avg(price)as averageprice from book_details where category='java';

select count(book_code)no_of_books_available from book_details where book_code not in(select book_code from book_issue);

select book_code,book_details,rack_num from book_details where rack_num='A1' order by book_details;

select count(rack_num)no_of_books,rack_num from book_details group by rack_num order by count(rack_num);