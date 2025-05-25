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

INSERT INTO products (product_name, product_price, product_count, product_color, product_city) VALUES 
('Milk', 1.99, 100, 'white', 'Kyiv'),
('Meat', 5.00, 50, 'red', 'Lviv'),
('Water', 1.00, 200, 'blue', 'Odesa'),
('Cake', 3.20, 30, 'pink', 'Kharkiv'),
('Fish', 6.00, 75, 'grey', 'Dnipro'),
('Milk', 1.99, 100, 'white', 'Kyiv')
;



CREATE TABLE shops (
	shop_id INT NOT NULL AUTO_INCREMENT,
	shop_name VARCHAR(20),
	number_of_shops INT(20),
	shop_ceo VARCHAR(20),
	shop_EDRPOU INT(10),
	shop_color VARCHAR(10),
	PRIMARY KEY (shop_id)
);

INSERT INTO shops(shop_name, number_of_shops, shop_ceo, shop_EDRPOU, shop_color) VALUES
('NOVUS', 81, 'Mark Petkevich', 36003603, 'green'),
('Silpo', 300, 'Sergey Titovskyi', 40720198, 'orange'),
('Fora', 340, 'Joe Essenfeld', 32294897, 'white'),
('ATB', 1200, 'Yatsuta Igor', 32729966, 'blue')
;
DROP TABLE IF EXISTS shops;



CREATE TABLE tech_products(
    tech_product_id INT NOT NULL AUTO_INCREMENT,
    brand VARCHAR(20), 
    divice VARCHAR(20),
    price INT(10),
    memory INT(5),
    color VARCHAR(25),
    PRIMARY KEY (tech_product_id)
);

INSERT INTO tech_products (brand, divice, price, memory, color) VALUES 
('Apple', 'iPhone 16', 1099, 256, 'black'),
('Samsung', 'Flip 2' , 900, 512, 'white'),
('OPPO', 'Reno7', 790, 256, 'grey'),
('Vivo', '8', 550, 128, 'red'),
('MI', 'Redmi 11', 880, 512, 'Dnipro'),
('Google', 'Pixel', 1150 , 256, 'white')
;



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

INSERT INTO watches (watch_brand, watch_model, watches_type, watches_price, watches_color, watches_country) VALUES 
('Apple', 'Watch 10', 'Smartwatch', 590, 'black', 'USA'),
('Casio', 'Flip 2' , 'Chronograph', 300, 'white', 'Japan'),
('Cartier', 'Panthere', 'Chronograph', 15700, 'green', 'Switzerland'),
('Hublot', 'Classic Fusion', 'Chronograph', 14900, 'black', 'Switzerland'),
('Breguet', 'RedMarinemi', 'Chronograph', 15012, 'red', 'Switzerland'),
('Rolex', 'Sea-Dweller', 'Chronograph' , 10256, 'blue', 'Switzerland')
;
DROP TABLE IF EXISTS watches;


CREATE TABLE books(
    book_id INT NOT NULL AUTO_INCREMENT,   
    title VARCHAR(100),               
    author VARCHAR(100),              
    publication_year INT(20),             
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    PRIMARY KEY (book_id)
);

INSERT INTO books (title, author, publication_year, genre, price)
VALUES 
    ('1984', 'George Orwell', 1949, 'Dystopian', 149.90),
    ('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic', 129.50),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic', 119.00),
    ('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 199.99),
    ('Brave New World', 'Aldous Huxley', 1932, 'Science Fiction', 139.75)
;



SHOW TABLES;
SELECT * FROM products
SELECT * FROM shops
SELECT * FROM tech_products
SELECT * FROM watches
SELECT * FROM books


-- 
SELECT 
    s.shop_name,
    p.product_name,
    p.product_color,
    t.brand AS tech_brand,
    w.watch_brand,
    b.title AS book_title
FROM shops s
JOIN products p ON s.shop_color = p.product_color
JOIN tech_products t ON p.product_color = t.color
JOIN watches w ON p.product_color = w.watches_color
JOIN books b ON b.genre = 'Classic';


-- 
SELECT product_name, product_price, product_city
FROM products
WHERE product_color = 'white' AND product_city = 'Kyiv';



-- 
SELECT genre, COUNT(*) AS book_count
FROM books
GROUP BY genre
HAVING COUNT(*) > 1;



-- 
SELECT brand, divice, price
FROM tech_products
ORDER BY price DESC;



-- 
SELECT watch_brand, watch_model, watches_price
FROM watches
ORDER BY watches_price DESC
LIMIT 3;



