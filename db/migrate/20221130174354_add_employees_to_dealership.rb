class AddEmployeesToDealership < ActiveRecord::Migration[5.2]
  def change
    add_column :dealerships, :employees, :integer
  end
end
