class Dealership < ApplicationRecord
  has_many :cars

  def car_count
    cars_count
  end

  def alphabetical_order
    cars.order(Arel.sql("lower(name)"))
  end

  def year_limit(year)
    cars.where("year >= #{year}")
  end

  def self.order_by_car_count
    order('cars_count DESC')
  end

  def self.filter_by_name(name_input)
    name = arel_table[:name]
    where(name.matches("%#{name_input}%"))
  end
end