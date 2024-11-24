-- Create Data Base
CREATE DATABASE stores COLLATE utf8mb4_unicode_ci;
-- Create Table governorates 
CREATE TABLE governorates( 
    `name-country` varchar(15) not null PRIMARY KEY
    );
-- Create Table Store
CREATE TABLE store(
    `name` varchar(20) not null PRIMARY KEY,
    `address` varchar(20) not null
    `name_p` varchar(20) not null,
    FOREIGN KEY(`name_p`) REFERENCES product(name)  on update cascade on delete cascade 
    );
-- Create Table supplier 
CREATE TABLE supplier(
    `name` varchar(20) not null,
    `phone` varchar(11) not null,
    `email` varchar(20) not null UNIQUE,
    ` brief-data` datetime DEFAULT NOW(),
    PRIMARY KEY(name)
    );
-- Create Table product
CREATE TABLE product(
    `name` varchar(20) not null,
    `code` varchar(5) not null UNIQUE,
    `description` text,
    `price` integer(5),
    PRIMARY KEY(name)
    );
-- Create Table governorates_store
CREATE TABLE governorates_store(
`name-country_G` varchar(15) not null,
`name_S` varchar(20) not null,
PRIMARY KEY(`name-country_G`, `name_S`),
FOREIGN KEY(`name-country_G`) REFERENCES governorates(`name-country`)  on update cascade on delete cascade,
FOREIGN KEY(`name_S`) REFERENCES store(`name`)  on update cascade on delete cascade 
);


-- Use the same database that we used in the lecture:

-- 1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that contain any product starting with code S18 and price more than 100.
SELECT DISTINCT orderNumber FROM orderdetails WHERE productCode LIKE 'S18_%' AND priceEach > 100;

-- 2- from “payments” table. Write a query to get all payments that were made on day 5 or 6 (whatever month or year).
SELECT * FROM payments WHERE paymentDate LIKE '%-%-05' OR paymentDate LIKE '%-%-06';

-- 3- from “customers” table. Write a query to get the fifth-highest credit limit of the customers who (live in the USA and their phone number contains 5555).
SELECT customerNumber FROM customers WHERE country = 'USA' AND phone LIKE '%5555%' ORDER BY customerNumber DESC LIMIT 1 OFFSET 5;
