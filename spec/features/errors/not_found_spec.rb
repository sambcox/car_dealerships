require 'rails_helper'

RSpec.describe 'Error Landing', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit a wrong id' do
      it 'shows a helpful error message' do
        visit 'dealerships/0'

        expect(page).to have_content("That page can't be found!")

        visit 'cars/0'

        expect(page).to have_content("That page can't be found!")

        visit 'dealerships/0/cars/new'

        expect(page).to have_content("That page can't be found!")

        visit 'dealerships/0/edit'

        expect(page).to have_content("That page can't be found!")

        visit 'cars/0/edit'

        expect(page).to have_content("That page can't be found!")
      end
    end
  end
end