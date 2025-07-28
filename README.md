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
  { item: "Chapati", quantity: 10, price: 200.00, status: "delivered", customer: customers[0] },
  { item: "Samosa", quantity: 5, price: 150.00, status: "pending", customer: customers[0] },
  { item: "Ugali & Sukuma", quantity: 3, price: 300.00, status: "delivered", customer: customers[1] },
  { item: "Mandazi", quantity: 20, price: 400.00, status: "cancelled", customer: customers[2] },
  { item: "Chapati", quantity: 6, price: 120.00, status: "delivered", customer: customers[2] },
  { item: "Nyama Choma", quantity: 2, price: 1000.00, status: "pending", customer: customers[3] },
  { item: "Pilau", quantity: 4, price: 500.00, status: "delivered", customer: customers[4] },
  { item: "Chips", quantity: 3, price: 300.00, status: "pending", customer: customers[4] },
  { item: "Soda", quantity: 5, price: 250.00, status: "delivered", customer: customers[0] },
  { item: "Tea", quantity: 7, price: 210.00, status: "cancelled", customer: customers[1] },
  { item: "Uji", quantity: 8, price: 160.00, status: "pending", customer: customers[3] },
  { item: "Bhajia", quantity: 6, price: 180.00, status: "delivered", customer: customers[2] },
  { item: "Mutura", quantity: 4, price: 200.00, status: "pending", customer: customers[0] },
  { item: "Mokimo", quantity: 5, price: 350.00, status: "delivered", customer: customers[1] },
  { item: "Matoke", quantity: 3, price: 270.00, status: "cancelled", customer: customers[4] },
  { item: "Samosa", quantity: 10, price: 300.00, status: "delivered", customer: customers[2] },
  { item: "Chapati", quantity: 12, price: 240.00, status: "pending", customer: customers[1] },
  { item: "Soda", quantity: 6, price: 300.00, status: "delivered", customer: customers[4] },
  { item: "Tea", quantity: 9, price: 270.00, status: "delivered", customer: customers[3] },
  { item: "Mandazi", quantity: 15, price: 300.00, status: "pending", customer: customers[0] }
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
