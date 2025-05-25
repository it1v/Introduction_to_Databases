CREATE DATABASE ASSIGNMENT1;
USE ASSIGNMENT1;



CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(20), 
    product_price DECIMAL(10, 2),
    product_count INT,
    product_color VARCHAR(20),
    product_city VARCHAR(25),
    PRIMARY KEY (product_id)
);



CREATE TABLE shops (
	shop_id INT NOT NULL AUTO_INCREMENT,
	shop_name VARCHAR(20),
	number_of_shops INT(20),
	shop_ceo VARCHAR(20),
	shop_EDRPOU INT(10),
	shop_color VARCHAR(10),
	PRIMARY KEY (shop_id)
);


CREATE TABLE tech_products(
    tech_product_id INT NOT NULL AUTO_INCREMENT,
    brand VARCHAR(20), 
    divice VARCHAR(20),
    price INT(10),
    memory INT(5),
    color VARCHAR(25),
    PRIMARY KEY (tech_product_id)
);



CREATE TABLE watches(
    watch_id INT NOT NULL AUTO_INCREMENT,
    watch_brand VARCHAR(20), 
    watch_model VARCHAR(20),
    watches_type VARCHAR(20),
    watches_price INT(10),
    watches_color VARCHAR(25),
    watches_country VARCHAR(20),
    PRIMARY KEY (watch_id)
);



CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT,   
    title VARCHAR(100),               
    author VARCHAR(100),              
    publication_year INT(20),             
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    PRIMARY KEY (book_id)
);




