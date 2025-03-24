-- Active: 1742804889400@@127.0.0.1@5432@bookstore_db
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) CHECK (price >= 0),
  stock INT NOT NULL,
  published_year INT NOT NULL
);

INSERT INTO books
(title, author, price, stock, published_year)
 VALUES 
(
  'Clean Code', 'Robert C. Martin', '35', '5', 2008
),
(
  'You Don''t Know JS', 'Kyle Simpson', '30', '8', 2014
),
(
  'Refactoring', 'Martin Fowler', '50', '3', 1999
),
(
  'Database Design Principles', 'Jane Smith', '20', '0', 2018
);


SELECT * FROM books

--Find books that are out of stock.

SELECT title FROM books 
  WHERE stock = 0;


--Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- Find the average price of books in the store
SELECT ROUND(AVG(price)) AS avg_book_price FROM books;