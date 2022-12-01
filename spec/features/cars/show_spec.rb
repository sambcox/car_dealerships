require 'rails_helper'

RSpec.describe 'Cars Show', type: :feature do

  describe 'As a user, ' do
    describe 'When I visit /cars/:id, ' do
      it 'displays information for only that specific car' do
        visit "/cars/#{@car_1.id}"

        expect(page).to have_content(@car_1.name)
        expect(page).to have_content(@car_1.year)
        expect(page).to have_content(@car_1.mileage)
        expect(page).to have_content(@car_1.color)
        expect(page).to have_content(@car_1.vin)

        expect(page).to_not have_content(@car_2.name)
      end
    end
  end
end