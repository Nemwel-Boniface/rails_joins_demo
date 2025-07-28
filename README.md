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
cd rails-joins-demo
