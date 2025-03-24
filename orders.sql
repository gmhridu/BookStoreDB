CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers (id) ON DELETE CASCADE,
    book_id INT REFERENCES books (id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    orders (
        customer_id,
        book_id,
        quantity,
        order_date
    )
VALUES (1, 2, 1, '2024-03-10'),
    (2, 1, 1, '2024-02-20'),
    (1, 3, 2, '2024-03-05');

SELECT * FROM orders;

-- Find the total number of orders placed by each customer
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM customers
    LEFT JOIN orders ON customers.id = orders.customer_id
WHERE
    quantity > 0
GROUP BY
    customers.name;

-- Calculate the total revenue generated from book sales
SELECT SUM(books.price * quantity) AS total_revenue
FROM orders
    JOIN books ON orders.book_id = books.id;

-- 8. Delete customers who haven't placed any orders
DELETE FROM customers 
  WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);