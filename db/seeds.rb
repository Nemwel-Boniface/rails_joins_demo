# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Starting Seeding now"

customers = Customer.create!([
  { name: "Nemwel Boniface", location: "Kisii", phone: "0712785678", email: "nemwel@gmail.com" },
  { name: "Akinyi Otieno", location: "Kisumu", phone: "0712345678", email: "akinyi@gmail.com" },
  { name: "Brian Mwangi", location: "Nairobi", phone: "0700111222", email: "brian@gmail.com" },
  { name: "Mercy Njuguna", location: "Nakuru", phone: "0733221144", email: "mercy@yahoo.com" },
  { name: "Kevin Kiptoo", location: "Eldoret", phone: "0722345678", email: "kiptoo@hotmail.com" },
  { name: "Faith Achieng", location: "Kisumu", phone: "0733445566", email: "faitha@gmail.com" }
])

Order.create!([
  { customer: customers[0], pastry: "Mandazi", quantity: 4, price_per_unit: 20, order_date: "2024-12-01" },
  { customer: customers[0], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-02" },
  { customer: customers[0], pastry: "Kaimati", quantity: 3, price_per_unit: 15, order_date: "2024-12-04" },
  { customer: customers[0], pastry: "Doughnut", quantity: 3, price_per_unit: 15, order_date: "2024-12-04" },
  { customer: customers[0], pastry: "Samosa", quantity: 3, price_per_unit: 15, order_date: "2024-12-04" },
  
  { customer: customers[1], pastry: "Doughnut", quantity: 5, price_per_unit: 25, order_date: "2024-12-05" },
  { customer: customers[1], pastry: "Samosa", quantity: 4, price_per_unit: 30, order_date: "2024-12-06" },
  { customer: customers[1], pastry: "Mandazi", quantity: 3, price_per_unit: 20, order_date: "2024-12-07" },
  { customer: customers[1], pastry: "Kaimati", quantity: 2, price_per_unit: 15, order_date: "2024-12-08" },
  
  { customer: customers[2], pastry: "Doughnut", quantity: 6, price_per_unit: 25, order_date: "2024-12-09" },
  { customer: customers[2], pastry: "Mandazi", quantity: 5, price_per_unit: 20, order_date: "2024-12-10" },
  { customer: customers[2], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-11" },

  { customer: customers[3], pastry: "Kaimati", quantity: 8, price_per_unit: 15, order_date: "2024-12-12" },
  { customer: customers[3], pastry: "Samosa", quantity: 3, price_per_unit: 30, order_date: "2024-12-13" },
  { customer: customers[3], pastry: "Doughnut", quantity: 7, price_per_unit: 25, order_date: "2024-12-14" },
  
  { customer: customers[4], pastry: "Mandazi", quantity: 6, price_per_unit: 20, order_date: "2024-12-15" },
  { customer: customers[4], pastry: "Samosa", quantity: 1, price_per_unit: 30, order_date: "2024-12-16" },
  { customer: customers[4], pastry: "Kaimati", quantity: 4, price_per_unit: 15, order_date: "2024-12-17" },
  { customer: customers[4], pastry: "Doughnut", quantity: 3, price_per_unit: 25, order_date: "2024-12-18" },
  { customer: customers[4], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-19" },
  { customer: customers[4], pastry: "Mandazi", quantity: 2, price_per_unit: 20, order_date: "2024-12-20" },
  { customer: customers[4], pastry: "Kaimati", quantity: 5, price_per_unit: 15, order_date: "2024-12-21" },

  { customer: customers[5], pastry: "Mandazi", quantity: 6, price_per_unit: 20, order_date: "2024-12-15" },
  { customer: customers[5], pastry: "Samosa", quantity: 1, price_per_unit: 30, order_date: "2024-12-16" },
  { customer: customers[5], pastry: "Kaimati", quantity: 4, price_per_unit: 15, order_date: "2024-12-17" },
  { customer: customers[5], pastry: "Doughnut", quantity: 3, price_per_unit: 25, order_date: "2024-12-18" },
  { customer: customers[5], pastry: "Samosa", quantity: 2, price_per_unit: 30, order_date: "2024-12-19" },
  { customer: customers[5], pastry: "Mandazi", quantity: 2, price_per_unit: 20, order_date: "2024-12-20" },
  { customer: customers[5], pastry: "Kaimati", quantity: 5, price_per_unit: 15, order_date: "2024-12-21" }
])

puts "Pssst! Seeding was complete and succesful!"