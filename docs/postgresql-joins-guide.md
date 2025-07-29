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