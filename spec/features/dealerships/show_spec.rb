require 'rails_helper'

RSpec.describe 'Dealerships Show', type: :feature do
  before :each do
    @dealership_1 = Dealership.create!({
      created_at: Time.now,
      updated_at: Time.now,
      name: Faker::Company.name,
      city: Faker::Address.city,
      service_department: Faker::Boolean.boolean(true_ratio: 0.8),
      employees: Faker::Number.between(from: 10, to: 1000)
    })

    @dealership_2 = Dealership.create!({
      created_at: Time.now,
      updated_at: Time.now,
      name: Faker::Company.name,
      city: Faker::Address.city,
      service_department: Faker::Boolean.boolean(true_ratio: 0.8),
      employees: Faker::Number.between(from: 10, to: 1000)
    })

    @car_1 = @dealership_1.cars.create!({
      created_at: Time.now,
      updated_at: Time.now,
      name: Faker::Vehicle.make_and_model,
      available: Faker::Boolean.boolean(true_ratio: 0.9),
      year: Faker::Vehicle.year,
      mileage: Faker::Vehicle.mileage,
      color: Faker::Vehicle.color,
      vin: Faker::Vehicle.vin
    })

    @car_2 = @dealership_2.cars.create!({
      created_at: Time.now,
      updated_at: Time.now,
      name: Faker::Vehicle.make_and_model,
      available: Faker::Boolean.boolean(true_ratio: 0.9),
      year: Faker::Vehicle.year,
      mileage: Faker::Vehicle.mileage,
      color: Faker::Vehicle.color,
      vin: Faker::Vehicle.vin
    })
  end

  describe 'As a user, ' do
    describe 'When I visit /dealerships/:id, ' do
      it 'I can see specific information for just the dealership navigated to' do
        visit "/dealerships/#{@dealership_1.id}"

        expect(page).to have_content(@dealership_1.name)
        expect(page).to have_content(@dealership_1.city)
        expect(page).to_not have_content(@dealership_2.name)
      end

      it 'Displays the amount of cars owned by that specific dealership' do
        visit "/dealerships/#{@dealership_1.id}"

        expect(page).to have_content(@dealership_1.car_count)
      end

      it 'Includes a link to the cars index of this specific dealership' do
        visit "/dealerships/#{@dealership_1.id}"

        click_on "Explore this dealership's inventory"

        expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
      end
    end
  end
end