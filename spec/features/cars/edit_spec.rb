require 'rails_helper'

RSpec.describe 'Cars Edit', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /cars/:id/edit,' do
      it 'I can see a form asking for all correct information' do
        visit "/cars/#{@car_1.id}/edit"

        expect(page).to have_content('Make and Model')
        expect(page).to have_content('available')
        expect(page).to have_field("name", with: @car_1.name)
        expect(page).to have_field('year', with: @car_1.year)
        page.fill_in 'year', with: '1999'
        expect(page).to have_field('year', with: '1999')
      end

      it 'can update a car' do
        visit "/cars/#{@car_1.id}/edit"

        page.fill_in 'name', with: "Porsche 911"
        page.fill_in 'vin', with: 'WP1AA2T349T822365'
        page.fill_in 'color', with: 'GT Silver'
        page.fill_in 'year', with: '2007'
        page.fill_in 'mileage', with: '21050'
        choose(:available, with: :true)
        click_on 'Update Car'
        expect(current_path).to eq "/cars/#{@car_1.id}"
        expect(page).to have_content("Porsche 911")
      end
    end
  end
end