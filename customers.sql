CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO
    customers (name, email, joined_date)
VALUES (
        'Alice',
        'alice@email.com',
        '2023-01-10'
    ),
    (
        'Bob',
        'bob@email.com',
        '2022-05-15'
    ),
    (
        'Charlie',
        'charlie@email.com',
        '2023-06-20'
    );

SELECT * FROM customers;

