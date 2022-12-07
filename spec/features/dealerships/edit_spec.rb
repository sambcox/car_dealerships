require 'rails_helper'

RSpec.describe 'Dealerships Edit', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /dealerships/:id/edit, ' do
      it 'I can see a form asking for all correct information prefilled' do
        visit "/dealerships/#{@dealership_1.id}/edit"

        expect(page).to have_content('Name')
        expect(page).to have_content('City')
        expect(page).to have_content('Employees')
        expect(page).to have_content('service department')
        expect(page).to have_field('name', with: @dealership_1.name)
        expect(page).to have_field('city', with: @dealership_1.city)
        expect(page).to have_field('employees', with: @dealership_1.employees)
      end

      it 'can edit a dealership' do
        visit "/dealerships/#{@dealership_1.id}/edit"

        page.fill_in 'name', with: "Sam's Porsche"
        page.fill_in 'city', with: 'Parker'
        page.fill_in 'employees', with: '1234'
        choose(:service_department, with: :true)
        click_on 'Update Dealership'
        expect(current_path).to eq "/dealerships/#{@dealership_1.id}"
        expect(page).to have_content("Sam's Porsche")
      end
    end
  end
end
