require 'rails_helper'

RSpec.describe 'Dealerships Cars Index', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /dealerships/:id/cars, ' do
      it 'shows only the cars for that specific dealership' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_content(@car_1.name)
        expect(page).to have_content(@car_1.vin)

        expect(page).to_not have_content(@car_2.name)
      end

      it 'Has a link to create a new car' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_content('Create Car')

        click_on 'Create Car'

        expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars/new")
      end

      it 'Has a link to sort by alphabetical order' do
        visit "/dealerships/#{@dealership_2.id}/cars"

        expect(page).to have_content('Sort by Make and Model')

        click_on 'Sort by Make and Model'

        expect(@car_3.name).to appear_before (@car_2.name)
      end

      it 'Includes a link to update each car' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_content('Update this car')

        first('.update').click_on('Update this car')

        expect(current_path).to eq("/cars/#{@car_1.id}/edit")
      end

      it 'has a link to delete each car' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_button("Delete this car")

        first('.update').click_button('Delete this car')

        expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
        expect(page).to_not have_content(@car_1.name)
      end

      it 'Includes a form to limit the cars by year' do
        visit "/dealerships/#{@dealership_1.id}/cars"

        expect(page).to have_field('year')

        fill_in('year', with: 2000)

        click_on 'Submit'

        expect(page).to_not have_content(@car_1.name)
      end
    end
  end
end
