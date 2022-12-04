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

      it 'has a link to edit the car' do
        visit "/cars/#{@car_1.id}"

        expect(page).to have_content("Update this car")

        click_on 'Update this car'

        expect(current_path).to eq("/cars/#{@car_1.id}/edit")
      end

      it 'has a link to delete the car' do
        visit "/cars/#{@car_1.id}"

        expect(page).to have_button("Delete this car")

        click_button 'Delete this car'

        expect(current_path).to eq("/cars")
        expect(page).to_not have_content(@car_1.name)
      end
    end
  end
end