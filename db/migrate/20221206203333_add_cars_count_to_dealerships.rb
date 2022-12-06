class AddCarsCountToDealerships < ActiveRecord::Migration[5.2]
  def change
    add_column :dealerships, :cars_count, :integer
  end
end
