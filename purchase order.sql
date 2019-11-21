select * from tblUsers

select * from role

drop table role
--------------------role-----------------------------------
create table Role
(
RoleId int primary key not null,
RoleName varchar(50) not null
)

--------------User----------------------------------
create table tblUsers
(
User_Id int primary key not null,
User_Name varchar(50) not null,
Email varchar(50) unique not null,
Password varchar(30) not null,
Address varchar2(50) not null,
Mobile_no int not null,
IsActive varchar2(2) not null,
Created_date date,
Created_by varchar2(30),
Updated_by  varchar2(30),
Updated_date date,
RoleId int,
 FOREIGN KEY (RoleId) REFERENCES Role (RoleId),
seller_Id int,
 FOREIGN KEY (seller_Id) REFERENCES seller (seller_Id)

)

---------------seller------------------------
create table Seller
(
seller_Id int primary key not null,
seller_Name varchar(50) not null,
Email varchar(50) unique not null,
Password varchar(30) not null,
Address varchar2(50) not null,
Mobile_no int not null,
IsActive varchar2(2) not null,
Created_date date,
Created_by varchar2(30),
Updated_by  varchar2(30),
Updated_date date
)

drop table seller

ALTER TABLE Seller ADD user_id int;
ADD FOREIGN KEY (User_Id) REFERENCES tblUsers(User_Id);

ALTER TABLE Seller ADD Vendor_Id int;
ALTER TABLE Seller ADD FOREIGN KEY (Vendor_Id) REFERENCES Vendor(Vendor_Id);

------------------------vender-------------------------
create table Vendor
(
Vendor_Id int primary key not null,
Vendor_Name varchar(50) not null,
Email varchar(50) unique not null,
Password varchar(30) not null,
Address varchar2(50) not null,
Mobile_no int not null,
IsActive varchar2(2) not null,
Created_date date,
Created_by varchar2(30),
Updated_by  varchar2(30),
Updated_date date,

status_id int,
 FOREIGN KEY (status_id) REFERENCES po_status (status_id),
seller_Id int,
 FOREIGN KEY (seller_Id) REFERENCES seller (seller_Id)
)


ALTER TABLE vendor ADD product_id int;

ALTER TABLE vendor ADD FOREIGN KEY (product_id) REFERENCES products(product_id);
---------------------------------------******------------------


drop table Role

CREATE SEQUENCE User_id
start with 4
increment by 1

insert into Role values(1,'buyer'); 
insert into Role values(2,'seller');
insert into Role values(3,'vendor');

-----------------------Products------------------
create table products
(
product_Id int primary key,
product_name varchar2(20) not null,
product_details varchar2(50) not null,
product_price float not null
)

select * from products

drop table products
commit
--------------PurchaseOrder--------------
create table po_order
(
po_Id int primary key,
po_name varchar2(20) not null,
address varchar2(50) not null,
Created_date date,
Created_by varchar2(30),
Updated_by  varchar2(30),
Updated_date date,
User_Id int,
 FOREIGN KEY (User_Id) REFERENCES tblUsers (User_Id),
 product_Id int,
 FOREIGN KEY (product_Id) REFERENCES products (product_Id)
)
commit
---------------------poStatus-------------
create table po_status
(
status_Id int primary key,
status_name varchar2(20) not null
)
commit
drop table po_status

select * from tblUsers

select * from seller

select * from vendor

select * from po_status
select * from po_order

commit

