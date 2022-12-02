require 'rails_helper'

RSpec.describe 'Dealerships Show', type: :feature do
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

      it 'Includes a link to edit this specific dealership' do
        visit "/dealerships/#{@dealership_1.id}"

        expect(page).to have_content("Update this dealership")

        click_on 'Update this dealership'

        expect(current_path).to eq("/dealerships/#{@dealership_1.id}/edit")
      end
    end
  end
end