class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :pastry
      t.string :status
      t.integer :quantity
      t.integer :price_per_unit
      t.date :order_date

      t.timestamps
    end
  end
end
