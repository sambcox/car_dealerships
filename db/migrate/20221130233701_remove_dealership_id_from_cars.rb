class RemoveDealershipIdFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :dealership_id, :integer
  end
end
