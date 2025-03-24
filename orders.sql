CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  book_id INT REFERENCES books(id) ON DELETE CASCADE,
  quantity INT CHECK (quantity > 0),
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

