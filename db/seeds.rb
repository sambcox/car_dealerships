# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts 'Clearing the Database'
Dealership.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('dealerships')
Car.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('dealerships')

puts 'Creating Dealerships'
10.times do
  created_at = Time.now
  updated_at = Time.now
  name = Faker::Company.name
  city = Faker::Address.city
  service_department = Faker::Boolean.boolean(true_ratio: 0.8)
  employees = Faker::Number.between(from: 10, to: 1000)
  Dealership.create({
                      name: name,
                      city: city,
                      service_department: service_department,
                      created_at: created_at,
                      updated_at: updated_at,
                      employees: employees
                    })
end

puts 'Creating Cars'
Dealership.all.each do |dealership|
  10.times do
    created_at = Time.now
    updated_at = Time.now
    name = Faker::Vehicle.make_and_model
    available = Faker::Boolean.boolean(true_ratio: 0.9)
    year = Faker::Vehicle.year
    mileage = Faker::Vehicle.mileage
    color = Faker::Vehicle.color
    vin = Faker::Vehicle.vin
    dealership.cars.create({
                             name: name,
                             available: available,
                             year: year,
                             mileage: mileage,
                             color: color,
                             vin: vin,
                             created_at: created_at,
                             updated_at: updated_at
                           })
  end
end
