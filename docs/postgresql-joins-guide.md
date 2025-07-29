# PostgreSQL Joins Demonstration - Kenyan Pastry Shop

This guide provides all the SQL commands needed to set up a sample database and test various join types using PostgreSQL.

## Database Setup

### 1. Create Database and Tables

-- Connect to your PostgreSQL (run this in your terminal)
`psql -U <your_username> -d postgres`

-- Create the database
`CREATE DATABASE kenyan_pastries_shop;`

<img width="1165" height="219" alt="Image" src="https://github.com/user-attachments/assets/0b0bcae6-16eb-4e57-8863-e6480ac986b1" />

-- Connect to the new database
`\c kenyan_pastries_shop`

-- Create customers table
```
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

-- Create orders table
```
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    pastry VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL,
    price_per_unit DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
);
```

<img width="1118" height="491" alt="Image" src="https://github.com/user-attachments/assets/17afd9f6-a487-4357-86b5-fc6a14b7c3ff" />


### 2. Insert Sample Data

```
-- Insert customers
INSERT INTO customers (name, location, phone, email) VALUES
('Nemwel Boniface', 'Kisii', '0712785678', 'nemwel@gmail.com'),
('Akinyi Otieno', 'Kisumu', '0712345678', 'akinyi@gmail.com'),
('Brian Mwangi', 'Nairobi', '0700111222', 'brian@gmail.com'),
('Mercy Njuguna', 'Nakuru', '0733221144', 'mercy@yahoo.com'),
('Kevin Kiptoo', 'Eldoret', '0722345678', 'kiptoo@hotmail.com'),
('Faith Achieng', 'Kisumu', '0733445566', 'faitha@gmail.com');
```

<img width="1138" height="204" alt="Image" src="https://github.com/user-attachments/assets/5eb2cea3-e8b5-4e76-8689-b810ee0348e7" />

<img width="1138" height="280" alt="Image" src="https://github.com/user-attachments/assets/654f3708-e8e3-40d5-94b6-3d8b9f27b4a0" />

```
-- Insert orders
INSERT INTO orders (customer_id, pastry, quantity, price_per_unit, order_date, status) VALUES
(1, 'Mandazi', 4, 20.00, '2024-12-01', 'completed'),
(1, 'Samosa', 2, 30.00, '2024-12-02', 'completed'),
(1, 'Kaimati', 3, 15.00, '2024-12-04', 'pending'),
(1, 'Doughnut', 3, 15.00, '2024-12-04', 'cancelled'),
(1, 'Samosa', 3, 15.00, '2024-12-04', 'completed'),

(2, 'Doughnut', 5, 25.00, '2024-12-05', 'completed'),
(2, 'Samosa', 4, 30.00, '2024-12-06', 'completed'),
(2, 'Mandazi', 3, 20.00, '2024-12-07', 'pending'),
(2, 'Kaimati', 2, 15.00, '2024-12-08', 'completed'),

(3, 'Doughnut', 6, 25.00, '2024-12-09', 'completed'),
(3, 'Mandazi', 5, 20.00, '2024-12-10', 'completed'),
(3, 'Samosa', 2, 30.00, '2024-12-11', 'pending'),

(4, 'Kaimati', 8, 15.00, '2024-12-12', 'completed'),
(4, 'Samosa', 3, 30.00, '2024-12-13', 'completed'),
(4, 'Doughnut', 7, 25.00, '2024-12-14', 'pending'),

(5, 'Mandazi', 6, 20.00, '2024-12-15', 'completed'),
(5, 'Samosa', 1, 30.00, '2024-12-16', 'completed'),
(5, 'Kaimati', 4, 15.00, '2024-12-17', 'pending'),
(5, 'Doughnut', 3, 25.00, '2024-12-18', 'completed'),
(5, 'Samosa', 2, 30.00, '2024-12-19', 'completed'),
(5, 'Mandazi', 2, 20.00, '2024-12-20', 'pending'),
(5, 'Kaimati', 5, 15.00, '2024-12-21', 'completed'),

(6, 'Mandazi', 6, 20.00, '2024-12-15', 'completed'),
(6, 'Samosa', 1, 30.00, '2024-12-16', 'completed'),
(6, 'Kaimati', 4, 15.00, '2024-12-17', 'pending'),
(6, 'Doughnut', 3, 25.00, '2024-12-18', 'completed'),
(6, 'Samosa', 2, 30.00, '2024-12-19', 'completed'),
(6, 'Mandazi', 2, 20.00, '2024-12-20', 'pending'),
(6, 'Kaimati', 5, 15.00, '2024-12-21', 'completed');
```

<img width="1491" height="721" alt="Image" src="https://github.com/user-attachments/assets/9d594e5d-4ac9-463d-8ece-8e6abc580093" />

<img width="1607" height="798" alt="Image" src="https://github.com/user-attachments/assets/01cfa921-bf6a-4ba0-b359-5a4e9edf8723" />

### 3. Connection Instructions

To test these queries:
1. Open your terminal
2.  Connect to PostgreSQL: `psql -U your_username -d kenyan_pastries_shop`
     - Enter your password when prompted

You can now run any of the following join queries

Join Query Examples
#### 1. INNER JOIN
```
-- Get customers with their orders (only customers who have ordered)
SELECT customers.name, customers.location, orders.pastry, orders.quantity
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;
```

<img width="1388" height="845" alt="Image" src="https://github.com/user-attachments/assets/8d0b246b-11ea-4d15-92be-ac54a48e748c" />

#### 2. LEFT OUTER JOIN
```
-- Get all customers, even if they haven't ordered
SELECT customers.name, customers.location, orders.pastry, orders.quantity
FROM customers
LEFT OUTER JOIN orders ON customers.id = orders.customer_id;
```

<img width="1388" height="845" alt="Image" src="https://github.com/user-attachments/assets/c9ea09fb-bad3-40b9-9430-3a86baaff35d" />

#### 3. RIGHT OUTER JOIN
```
-- Get all orders with customer info
SELECT customers.name, orders.pastry, orders.order_date, orders.status
FROM customers
RIGHT OUTER JOIN orders ON customers.id = orders.customer_id;
```

<img width="1388" height="845" alt="Image" src="https://github.com/user-attachments/assets/6bb49d52-4f7d-4a27-828e-a7c4ab0efa3e" />

#### 4. FULL OUTER JOIN
```
-- Get all records from both tables
SELECT customers.name, orders.pastry, orders.order_date
FROM customers
FULL OUTER JOIN orders ON customers.id = orders.customer_id;
```

<img width="1388" height="845" alt="Image" src="https://github.com/user-attachments/assets/d8162728-baf8-438e-b382-81c929b0a7d6" />

#### 5. SELF JOIN

First, set up the referral relationship:
```
-- Add referral column
ALTER TABLE customers ADD COLUMN referred_by INTEGER REFERENCES customers(id);
```

```
-- Update some referrals
UPDATE customers SET referred_by = 1 WHERE id IN (2, 3);
UPDATE customers SET referred_by = 2 WHERE id = 4;
```

Then run the self join:
```
-- Find customers and who referred them
SELECT c1.name AS customer, c2.name AS referred_by
FROM customers c1
LEFT JOIN customers c2 ON c1.referred_by = c2.id;
```

<img width="1388" height="475" alt="Image" src="https://github.com/user-attachments/assets/8875da79-fe83-442b-b72a-25ef078f15b6" />

#### 6. CROSS JOIN
```
-- Get all possible combinations of customers and pastries
SELECT c.name, p.pastry
FROM customers c
CROSS JOIN (SELECT DISTINCT pastry FROM orders) p;
```

<img width="1011" height="733" alt="Image" src="https://github.com/user-attachments/assets/1e17746b-6672-431d-a197-8b4f07e30888" />

**Other practical Join Examples**

```
-- 1. Find completed orders from Nairobi customers
SELECT c.name, o.pastry, o.order_date
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE c.location = 'Nairobi' AND o.status = 'completed';
```

```
-- 2. Count orders per customer (including those with zero orders)
SELECT c.name, COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY order_count DESC;
```

```
-- 3. Find customers who ordered both Mandazi and Samosa
SELECT DISTINCT c.name, c.location
FROM customers c
INNER JOIN orders o1 ON c.id = o1.customer_id AND o1.pastry = 'Mandazi'
INNER JOIN orders o2 ON c.id = o2.customer_id AND o2.pastry = 'Samosa';
```

```
-- 4. Calculate total sales by location
SELECT c.location, SUM(o.quantity * o.price_per_unit) AS total_sales
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.location
ORDER BY total_sales DESC;
````

### Main repository Link

For a complete Rails application demonstrating these concepts, see: GitHub [Repository Link](https://github.com/Nemwel-Boniface/rails_joins_demo).