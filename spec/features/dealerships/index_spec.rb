require 'rails_helper'

RSpec.describe 'Dealerships Index', type: :feature do
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

        expect(current_path).to eq('/dealerships/new')
      end

      it 'Includes a link to update each dealership' do
        visit "/dealerships"

        expect(page).to have_content('Update this dealership')

        first('.update').click_on('Update this dealership')

        expect(current_path).to eq("/dealerships/#{@dealership_2.id}/edit")
      end

      it 'Includes a link to delete each dealership' do
        visit "/dealerships"

        expect(page).to have_button("Delete this dealership")

        first('.update').click_button('Delete this dealership')

        expect(current_path).to eq("/dealerships")

        expect(page).to_not have_content(@dealership_2.name)
      end

      it 'Includes a link to sort by car count' do
        visit "/dealerships"

        expect(page).to have_content("Sort by Amount of Cars")

        click_on('Sort by Amount of Cars')

        expect(current_path).to eq("/dealerships")

        expect(@dealership_2.name).to appear_before(@dealership_1.name)
      end

      it 'Includes a box to filter by name exactly' do
        visit "/dealerships"

        expect(page).to have_content("Filter by dealership name")

        fill_in(:name_input, with: @dealership_1.name)

        click_on("Filter")

        expect(current_path).to eq("/dealerships")

        expect(page).to have_content(@dealership_1.name)
        expect(page).to_not have_content(@dealership_2.name)
      end

      it 'Includes a box to filter by name partially' do
        visit "/dealerships"

        expect(page).to have_content("Filter by dealership name")
        query = @dealership_1.name[0..-2]

        fill_in(:name_input, with: query)

        click_on("Filter")

        expect(current_path).to eq("/dealerships")

        expect(page).to have_content(@dealership_1.name)
        expect(page).to_not have_content(@dealership_2.name)
      end
    end
  end
end