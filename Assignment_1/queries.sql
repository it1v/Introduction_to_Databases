USE ASSIGNMENT1;


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
