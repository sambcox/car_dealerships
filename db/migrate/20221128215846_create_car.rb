class CreateCar < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.integer :dealership_id
      t.boolean :available
      t.integer :year
      t.integer :mileage
      t.string :color
      t.string :vin
    end
  end
end
