class Dealership < ApplicationRecord
  has_many :cars

  def car_count
    Car.where(dealership_id: self.id).count
  end
end