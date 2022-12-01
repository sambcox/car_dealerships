require 'rails_helper'

RSpec.describe 'Dealerships Index', type: :feature do
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
    describe 'When I visit /dealerships, ' do
      it 'I can see all of the dealership specific information' do
        visit "/dealerships"

        expect(page).to have_content(@dealership_1.name)
        expect(page).to have_content(@dealership_2.city)
        expect(page).to_not have_content(@car_1.name)
      end

      it 'Displays all information in the order of most recent' do
        visit "/dealerships"

        expect(@dealership_2.name).to appear_before(@dealership_1.name)
        expect(page).to have_content(@dealership_2.created_at)
      end

      it 'Includes a link to the cars index' do
        visit "/dealerships"

        expect('Back To All Cars').to appear_before(@dealership_2.name)

        click_on 'Back To All Cars'

        expect(current_path).to eq('/cars')
      end

      it 'Includes a link to create a new dealership' do
        visit "/dealerships"

        click_on 'New Dealership'

        expect(current_path).to eq('/dealerships/create')
      end
    end
  end
end