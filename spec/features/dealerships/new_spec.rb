require 'rails_helper'

RSpec.describe 'Dealerships New', type: :feature do
  describe 'As a user, ' do
    describe 'When I visit /dealerships/new, ' do
      it 'I can see a form asking for all correct information' do
        visit '/dealerships/new'

        expect(page).to have_content('Name:')
        expect(page).to have_content('City:')
        expect(page).to have_content('Employees:')
        expect(page).to have_content('service department')
        expect(page).to have_field("name")
        expect(page).to have_field('employees')
        page.fill_in 'employees', with: '1234'
        expect(page).to have_field('employees', with: '1234')
      end

      it 'can accept a new dealership' do
        visit '/dealerships/new'

        page.fill_in 'name', with: "Sam's Porsche"
        page.fill_in 'city', with: 'Parker'
        page.fill_in 'employees', with: '1234'
        choose 'This dealership has a service department.'
        click_on 'Create Dealership'
        expect(current_path).to eq '/dealerships'
        expect(page).to have_content("Sam's Porsche")
        expect("Sam's Porsche").to appear_before(@dealership_2.name)
      end
    end
  end
end