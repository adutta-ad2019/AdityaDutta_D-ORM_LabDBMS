DROP DATABASE IF EXISTS ECOMMERCE;

create database ecommerce;

use ecommerce;

create table supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50) not null
);

create table customer(
CUS_ID int primary key,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

CREATE TABLE category(
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL
);

CREATE TABLE product(
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT ,
FOREIGN KEY(CAT_ID) REFERENCES CATEGORY(CAT_ID)
);

CREATE TABLE supplier_pricing(
PRICING_ID INT PRIMARY KEY,
PRO_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY(PRO_ID) REFERENCES PRODUCT(PRO_ID),
FOREIGN KEY(SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

CREATE TABLE orders(
ORD_ID INT PRIMARY KEY,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
foreign key(CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY(PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE RATING(
RAT_ID INT PRIMARY KEY,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
FOREIGN KEY(ORD_ID) REFERENCES ORDERS(ORD_ID)
);


INSERT INTO SUPPLIER(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) VALUES
(1,"Rajesh Retails","Delhi",1234567890),
(2,"Appario Ltd.","Mumbai",2589631470),
(3,"Knome products","Banglore",9785462315),
(4,"Bansal Retails","Kochi",8975463285),
(5,"Mittal Ltd.","Lucknow",7898456532);

INSERT INTO CUSTOMER(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) VALUES
(1,"AAKASH", 9999999999, "DELHI", 'M'),
(2 ,"AMAN" ,9785463215 ,"NOIDA" ,'M'),
(3 ,"NEHA" ,9999999999 ,"MUMBAI", 'F'),
(4, "MEGHA", 9994562399 ,"KOLKATA", 'F'),
(5, "PULKIT", 7895999999, "LUCKNOW", 'M');

INSERT INTO  CATEGORY(CAT_ID,CAT_NAME) VALUES
(1, "BOOKS"),
(2 ,"GAMES"),
(3,"GROCERIES"),
(4 ,"ELECTRONICS"),
(5, "CLOTHES");

INSERT INTO PRODUCT(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) VALUES
(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2),
(2,"TSHIRT","SIZE-L with Black, Blue and White variations", 5),
(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4),
(4, "OATS" ,"Highly Nutritious from Nestle", 3),
(5 ,"HARRY POTTER","Best Collection of all time by J.K Rowling" ,1),
(6 ,"MILK" ,"1L Toned MIlk" ,3),
(7,"Boat Earphones" ,"1.5Meter long Dolby Atmos",4),
(8 ,"Jeans", "Stretchable Denim Jeans with various sizes and color" ,5),
(9 ,"Project IGI ","compatible with windows 7 and above" ,2),
(10, "Hoodie", "Black GUCCI for 13 yrs and above",5),
(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki",1),
(12, "Train Your Brain", "By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7 ,12 ,4 ,789),
(8, 3, 1, 31000),
(9 ,1 ,5 ,1450),
(10, 4, 2, 999),
(11 ,7 ,3 ,549),
(12, 7, 4, 529),
(13, 6, 2 ,105),
(14 ,6 ,1 ,99),
(15, 2, 5, 2999),
(16 ,5 ,2 ,2999);


INSERT INTO ORDERS(ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES
(101 ,1500, '2021-10-06', 2, 1),
(102 ,1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105 ,3000 ,'2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107 ,789 ,'2021-09-01' ,3 ,7),
(108, 780, '2021-09-07', 5, 6),
(109 ,3000 ,'2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112 ,789 ,'2021-09-16' ,4 ,7),
(113, 31000, '2021-09-16', 1, 8),
(114 ,1000 ,'2021-09-16' ,3 ,5),
(115, 3000, '2021-09-16', 5, 3),
(116 ,99 ,'2021-09-17' ,2 ,14);


INSERT INTO RATING(RAT_ID,ORD_ID,RAT_RATSTARS) VALUES
(1, 101, 4),
(2 ,102, 3),
(3, 103, 1),
(4 ,104, 2),
(5, 105, 4),
(6 ,106, 3),
(7, 107, 4),
(8 ,108, 4),
(9, 109, 3),
(10 ,110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14 ,114 ,1),
(15, 115, 1),
(16 ,116 ,0);

#QUERY4
SELECT CUS_GENDER,COUNT(*)  FROM 
CUSTOMER C JOIN ORDERS O USING (CUS_ID)
JOIN SUPPLIER_PRICING USING (PRICING_ID)
WHERE SUPP_PRICE>=3000
GROUP BY CUS_GENDER;

#QUERY5
SELECT ORD_ID,PRO_NAME FROM 
CUSTOMER JOIN ORDERS USING (CUS_ID)
JOIN SUPPLIER_PRICING USING (PRICING_ID)
JOIN PRODUCT USING (PRO_ID)
WHERE CUS_ID=2;

#QUERY6
SELECT SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE FROM 
SUPPLIER JOIN SUPPLIER_PRICING USING (SUPP_ID)
GROUP BY SUPP_ID HAVING COUNT(*)>1;

#query7
select CAT_ID,CAT_NAME,PRO_NAME,supp_price from
category join product using (CAT_ID)
JOIN SUPPLIER_PRICING USING (PRO_ID)
where (cat_id,supp_price) in (
select cat_id,min(supp_price) from 
product join supplier_pricing using (pro_id)
join category using (cat_id)
group by cat_id);

#Query8
select PRO_ID,PRO_NAME 
from customer join orders using (CUS_ID)
JOIN SUPPLIER_PRICING USING (PRICING_ID)
JOIN PRODUCT USING (PRO_ID)
WHERE ORD_DATE>'2021-10-05';

#QUERY9
SELECT CUS_NAME,CUS_GENDER FROM CUSTOMER WHERE CUS_NAME LIKE "%A" OR CUS_NAME LIKE "A%";

DELIMITER &&  
CREATE PROCEDURE get_type_of_service ()  
BEGIN  
	SELECT SUPP_ID,SUPP_NAME,AVG(RAT_RATSTARS) AS RATING,
	CASE
	WHEN AVG(RAT_RATSTARS) =5 THEN "EXCELLENT SERVICE"
	WHEN AVG(RAT_RATSTARS)<5 AND AVG(RAT_RATSTARS)>4 THEN "GOOD SERVICE"
	WHEN AVG(RAT_RATSTARS)<=4 AND AVG(RAT_RATSTARS)>2 THEN "AVERAGE SERVICE"
	ELSE "POOR SERVICE"
	END AS Type_of_Service
	FROM SUPPLIER JOIN SUPPLIER_PRICING USING (SUPP_ID)
	JOIN ORDERS USING (PRICING_ID)
	JOIN RATING USING (ORD_ID)
	GROUP BY SUPP_ID;
END &&  
DELIMITER ;  

CALL get_type_of_service ()  ;