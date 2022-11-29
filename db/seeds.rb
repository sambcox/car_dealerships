# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating Dealerships'
10.times do
  created_at = Time.now
  updated_at = Time.now
  name = Faker::Company.name
  city = Faker::Address.city
  service_department = Faker::Boolean.boolean(true_ratio: 0.8)
Dealership.create({
  name: name,
  city: city,
  service_department: service_department,
  created_at: created_at,
  updated_at: updated_at
})
end

puts 'Creating Cars'
100.times do
  created_at = Time.now
  updated_at = Time.now
  name = Faker::Vehicle.make_and_model
  dealership_id = Faker::Number.between(from: 1, to: 10)
  available = Faker::Boolean.boolean(true_ratio: 0.9)
  year = Faker::Vehicle.year
  mileage = Faker::Vehicle.mileage
  color = Faker::Vehicle.color
  vin = Faker::Vehicle.vin
Car.create({
  name: name,
  dealership_id: dealership_id,
  available: available,
  year: year,
  mileage: mileage,
  color: color,
  vin: vin,
  created_at: created_at,
  updated_at: updated_at
})
end