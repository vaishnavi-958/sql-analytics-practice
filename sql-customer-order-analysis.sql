## Dataset (Table creation)

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

## Data 
INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Emma', 'Chicago'),
(3, 'Michael', 'Dallas'),
(4, 'Sophia', 'New York');

INSERT INTO orders VALUES
(101, 1, '2025-01-01', 250),
(102, 2, '2025-01-03', 300),
(103, 1, '2025-01-10', 150),
(104, 3, '2025-01-11', 400),
(105, 4, '2025-01-15', 200);

#Total amount spent per customer

SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

#Top spending customer

SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

#Running total using Window Function

SELECT order_id,
       customer_id,
       amount,
       SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM orders;

