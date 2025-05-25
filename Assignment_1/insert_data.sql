USE ASSIGNMENT1;



INSERT INTO products (product_name, product_price, product_count, product_color, product_city) VALUES 
('Milk', 1.99, 100, 'white', 'Kyiv'),
('Meat', 5.00, 50, 'red', 'Lviv'),
('Water', 1.00, 200, 'blue', 'Odesa'),
('Cake', 3.20, 30, 'pink', 'Kharkiv'),
('Fish', 6.00, 75, 'grey', 'Dnipro'),
('Milk', 1.99, 100, 'white', 'Kyiv')
;



INSERT INTO shops(shop_name, number_of_shops, shop_ceo, shop_EDRPOU, shop_color) VALUES
('NOVUS', 81, 'Mark Petkevich', 36003603, 'green'),
('Silpo', 300, 'Sergey Titovskyi', 40720198, 'orange'),
('Fora', 340, 'Joe Essenfeld', 32294897, 'white'),
('ATB', 1200, 'Yatsuta Igor', 32729966, 'blue')
;
DROP TABLE IF EXISTS shops;



INSERT INTO tech_products (brand, divice, price, memory, color) VALUES 
('Apple', 'iPhone 16', 1099, 256, 'black'),
('Samsung', 'Flip 2' , 900, 512, 'white'),
('OPPO', 'Reno7', 790, 256, 'grey'),
('Vivo', '8', 550, 128, 'red'),
('MI', 'Redmi 11', 880, 512, 'Dnipro'),
('Google', 'Pixel', 1150 , 256, 'white')
;



INSERT INTO watches (watch_brand, watch_model, watches_type, watches_price, watches_color, watches_country) VALUES 
('Apple', 'Watch 10', 'Smartwatch', 590, 'black', 'USA'),
('Casio', 'Flip 2' , 'Chronograph', 300, 'white', 'Japan'),
('Cartier', 'Panthere', 'Chronograph', 15700, 'green', 'Switzerland'),
('Hublot', 'Classic Fusion', 'Chronograph', 14900, 'black', 'Switzerland'),
('Breguet', 'RedMarinemi', 'Chronograph', 15012, 'red', 'Switzerland'),
('Rolex', 'Sea-Dweller', 'Chronograph' , 10256, 'blue', 'Switzerland')
;
DROP TABLE IF EXISTS watches;



INSERT INTO books (title, author, publication_year, genre, price)
VALUES 
    ('1984', 'George Orwell', 1949, 'Dystopian', 149.90),
    ('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic', 129.50),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic', 119.00),
    ('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 199.99),
    ('Brave New World', 'Aldous Huxley', 1932, 'Science Fiction', 139.75)
;