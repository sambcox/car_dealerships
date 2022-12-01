require 'rails_helper'

RSpec.describe 'Cars Index', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /cars, ' do
      it 'I can see all of the car specific information' do
        dealership_1 = Dealership.create!({
          created_at: Time.now,
          updated_at: Time.now,
          name: Faker::Company.name,
          city: Faker::Address.city,
          service_department: Faker::Boolean.boolean(true_ratio: 0.8),
          employees: Faker::Number.between(from: 10, to: 1000)
        })

        car_1 = dealership_1.cars.create!({
          created_at: Time.now,
          updated_at: Time.now,
          name: Faker::Vehicle.make_and_model,
          available: Faker::Boolean.boolean(true_ratio: 0.9),
          year: Faker::Vehicle.year,
          mileage: Faker::Vehicle.mileage,
          color: Faker::Vehicle.color,
          vin: Faker::Vehicle.vin
        })

        car_2 = dealership_1.cars.create!({
          created_at: Time.now,
          updated_at: Time.now,
          name: Faker::Vehicle.make_and_model,
          available: Faker::Boolean.boolean(true_ratio: 0.9),
          year: Faker::Vehicle.year,
          mileage: Faker::Vehicle.mileage,
          color: Faker::Vehicle.color,
          vin: Faker::Vehicle.vin
        })

        visit '/cars'

        expect(page).to have_content(car_1.name)
        expect(page).to have_content(car_1.year)
        expect(page).to have_content(car_1.mileage)
        expect(page).to have_content(car_1.color)
        expect(page).to have_content(car_1.vin)
        expect(page).to have_content(car_2.name)
        expect(page).to have_content(car_2.year)
        expect(page).to have_content(car_2.mileage)
        expect(page).to have_content(car_2.color)
        expect(page).to have_content(car_2.vin)
      end
    end
  end
end