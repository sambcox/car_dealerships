require 'rails_helper'

RSpec.describe 'Dealerships Index', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /dealerships/:id/cars, ' do
      it 'shows only the cars for that specific dealership' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_content(@car_1.name)
        expect(page).to have_content(@car_1.vin)

        expect(page).to_not have_content(@car_2.name)
      end
    end
  end
end
