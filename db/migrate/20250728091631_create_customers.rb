class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :location
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
