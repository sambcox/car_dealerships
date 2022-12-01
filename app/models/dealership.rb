class Dealership < ApplicationRecord
  has_many :cars

  def car_count
    self.cars.count
  end
end