class CreateDealership < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.string :city
      t.boolean :service_department
      t.integer :employees
    end
  end
end
