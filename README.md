# Rails Joins Playground (Console-Only)

This is a lightweight Ruby on Rails 7.2.1 application designed for developers to practice SQL joins using the Rails console. It uses two main resources: `Customer` and `Order`. The app models a basic business relationship where customers place orders.

The focus is on exploring different types of joins (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `CROSS JOIN`, etc.) through real queries in the Rails console, using both ActiveRecord and raw SQL.

> 🚫 **Note:** This app does **not** include any views or frontend. It's purely a backend data model intended for SQL join experimentation.

---

## 📦 Contents

- Two models: `Customer` and `Order`
- Associations:
  - A customer has many orders
  - An order belongs to a customer
- A `db/seeds.rb` file with localized Kenyan data (5 customers and 20 orders)
- Ready-to-use PostgreSQL setup
- Ideal for SQL joins practice using Rails console

---

## 🛠 Option 1: Clone and Run Locally

If the app already exists and you are cloning from a repository:

### 1. Clone the repository

```bash
git clone git@github.com:Nemwel-Boniface/rails_joins_demo.git
cd rails_joins_demo
```

### 2. Install dependencies

`bundle install`

### 3. Set up your database credentials

Open the config/database.yml file and update the development and test sections with your local PostgreSQL username and password.

```
username: your_pg_username
password: your_pg_password
```

### 4. Set up the database

```
rails db:create
rails db:migrate
rails db:seed
```

### 5. Open the Rails console

`rails console`

You're now ready to experiment with Rails join queries in the console!


## Option 2: Create Your Own Demo App from Scratch

If you want to build this from the ground up:

### 1. Create a new Rails app

Make sure you have Rails 7.2.1 installed.

```
rails _7.2.1_ new rails_joins_demo -d postgresql
cd rails_joins_demo
```

### 2. Configure your database

Edit config/database.yml and update with your local PostgreSQL credentials under development and test.

### 3. Generate the models and migrate

```
rails generate model Customer name:string email:string city:string phone:string registered_on:date
rails generate model Order item:string quantity:integer price:decimal status:string customer:references
rails db:create
rails db:migrate
```

### 4. Add associations

Edit app/models/customer.rb:

```
class Customer < ApplicationRecord
  has_many :orders
end
```

Edit app/models/order.rb:

```
class Order < ApplicationRecord
  belongs_to :customer
end
```

### 5. Seed the database

Edit db/seeds.rb with:

```
customers = Customer.create!([
  { name: "Wanjiku Njeri", email: "wanjiku@example.com", city: "Nairobi", phone: "0712345678", registered_on: "2022-01-15" },
  { name: "Kevin Otieno", email: "kevin@example.com", city: "Kisumu", phone: "0723456789", registered_on: "2021-12-03" },
  { name: "Faith Mwikali", email: "faith@example.com", city: "Machakos", phone: "0734567890", registered_on: "2023-03-10" },
  { name: "Brian Kipkemboi", email: "brian@example.com", city: "Eldoret", phone: "0745678901", registered_on: "2020-07-22" },
  { name: "Aisha Mohammed", email: "aisha@example.com", city: "Mombasa", phone: "0756789012", registered_on: "2022-11-01" }
])

Order.create!([
  { customer: customers[0], pastry: "Mandazi", quantity: 4, price_per_unit: 20, order_date: "2024-12-01", status: STATUSES.sample },
  { customer: customers[0], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-02", status: STATUSES.sample },
  { customer: customers[0], pastry: "Kaimati", quantity: 3, price_per_unit: 15, order_date: "2024-12-04", status: STATUSES.sample },
  { customer: customers[0], pastry: "Doughnut", quantity: 3, price_per_unit: 15, order_date: "2024-12-04", status: STATUSES.sample },
  { customer: customers[0], pastry: "Samosa", quantity: 3, price_per_unit: 15, order_date: "2024-12-04", status: STATUSES.sample },
  
  { customer: customers[1], pastry: "Doughnut", quantity: 5, price_per_unit: 25, order_date: "2024-12-05", status: STATUSES.sample },
  { customer: customers[1], pastry: "Samosa", quantity: 4, price_per_unit: 30, order_date: "2024-12-06", status: STATUSES.sample },
  { customer: customers[1], pastry: "Mandazi", quantity: 3, price_per_unit: 20, order_date: "2024-12-07", status: STATUSES.sample },
  { customer: customers[1], pastry: "Kaimati", quantity: 2, price_per_unit: 15, order_date: "2024-12-08", status: STATUSES.sample },
  
  { customer: customers[2], pastry: "Doughnut", quantity: 6, price_per_unit: 25, order_date: "2024-12-09", status: STATUSES.sample },
  { customer: customers[2], pastry: "Mandazi", quantity: 5, price_per_unit: 20, order_date: "2024-12-10", status: STATUSES.sample },
  { customer: customers[2], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-11", status: STATUSES.sample },

  { customer: customers[3], pastry: "Kaimati", quantity: 8, price_per_unit: 15, order_date: "2024-12-12", status: STATUSES.sample },
  { customer: customers[3], pastry: "Samosa", quantity: 3, price_per_unit: 30, order_date: "2024-12-13", status: STATUSES.sample },
  { customer: customers[3], pastry: "Doughnut", quantity: 7, price_per_unit: 25, order_date: "2024-12-14", status: STATUSES.sample },
  
  { customer: customers[4], pastry: "Mandazi", quantity: 6, price_per_unit: 20, order_date: "2024-12-15", status: STATUSES.sample },
  { customer: customers[4], pastry: "Samosa", quantity: 1, price_per_unit: 30, order_date: "2024-12-16", status: STATUSES.sample },
  { customer: customers[4], pastry: "Kaimati", quantity: 4, price_per_unit: 15, order_date: "2024-12-17", status: STATUSES.sample },
  { customer: customers[4], pastry: "Doughnut", quantity: 3, price_per_unit: 25, order_date: "2024-12-18", status: STATUSES.sample },
  { customer: customers[4], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-19", status: STATUSES.sample },
  { customer: customers[4], pastry: "Mandazi", quantity: 2, price_per_unit: 20, order_date: "2024-12-20", status: STATUSES.sample },
  { customer: customers[4], pastry: "Kaimati", quantity: 5, price_per_unit: 15, order_date: "2024-12-21", status: STATUSES.sample },

  { customer: customers[5], pastry: "Mandazi", quantity: 6, price_per_unit: 20, order_date: "2024-12-15", status: STATUSES.sample },
  { customer: customers[5], pastry: "Samosa", quantity: 1, price_per_unit: 30, order_date: "2024-12-16", status: STATUSES.sample },
  { customer: customers[5], pastry: "Kaimati", quantity: 4, price_per_unit: 15, order_date: "2024-12-17", status: STATUSES.sample },
  { customer: customers[5], pastry: "Doughnut", quantity: 3, price_per_unit: 25, order_date: "2024-12-18", status: STATUSES.sample },
  { customer: customers[5], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-19", status: STATUSES.sample },
  { customer: customers[5], pastry: "Mandazi", quantity: 2, price_per_unit: 20, order_date: "2024-12-20", status: STATUSES.sample },
  { customer: customers[5], pastry: "Kaimati", quantity: 5, price_per_unit: 15, order_date: "2024-12-21", status: STATUSES.sample }
])
```

Then run:

`rails db:seed`

### 6. Open the Rails console

`rails console`

Try things like:

```
Customer.joins(:orders).distinct
Order.includes(:customer).where(status: "pending")
Order.joins(:customer).where(customers: { city: "Nairobi" })
```

✅ You’re All Set!

Now you're ready to run join queries and explore how Active Record and SQL joins work together. Be sure to open rails console often and try both .joins, .includes, and raw SQL via ActiveRecord::Base.connection.execute.
