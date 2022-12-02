require 'rails_helper'

RSpec.describe 'Cars Index', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /cars, ' do
      it 'displays all cars across all dealerships' do
        visit '/cars'

        expect(page).to have_content(@car_1.name)
        expect(page).to have_content(@car_1.year)
        expect(page).to have_content(@car_1.mileage)
        expect(page).to have_content(@car_1.color)
        expect(page).to have_content(@car_1.vin)

        expect(page).to_not have_content(@dealership_1.name)
      end

      it 'Includes a link to the dealerships index' do
        visit "/cars"

        expect('Back To All Dealerships').to appear_before(@car_1.name)

        click_on 'Back To All Dealerships'

        expect(current_path).to eq('/dealerships')
      end

      it 'Only includes the available cars' do
        visit "/cars"

        expect(page).to have_content(@car_1.name)
        expect(page).to_not have_content(@car_3.name)
      end
    end
  end
end