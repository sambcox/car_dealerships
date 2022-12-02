require 'rails_helper'

RSpec.describe 'Dealerships New', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /dealerships/new,' do
      it 'I can see a form asking for all correct information' do
        visit "/dealerships/#{@dealership_1.id}/cars/new"

        expect(page).to have_content('Make and Model:')
        expect(page).to have_content('available')
        expect(page).to have_field("name")
        expect(page).to have_field('year')
        page.fill_in 'year', with: '1999'
        expect(page).to have_field('year', with: '1999')
      end

      it 'can accept a new dealership' do
        visit "/dealerships/#{@dealership_1.id}/cars/new"

        page.fill_in 'name', with: "Porsche 911"
        page.fill_in 'vin', with: 'WP1AA2T349T822365'
        page.fill_in 'color', with: 'GT Silver'
        page.fill_in 'year', with: '2007'
        page.fill_in 'mileage', with: '21050'
        choose 'This car is available.'
        click_on 'Create Car'
        expect(current_path).to eq "/dealerships/#{@dealership_1.id}/cars"
        expect(page).to have_content("Porsche 911")
      end
    end
  end
end