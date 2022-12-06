require 'rails_helper'

RSpec.describe Dealership, type: :model do
  describe 'relationships' do
    it { should have_many :cars }
  end

  describe 'instance methods' do
    it 'Returns the number of cars for the dealership correctly' do
      expect(@dealership_1.car_count).to eq 1
      expect(@dealership_2.car_count).to eq 2
    end

    it 'can return the cars in alphabetical order' do
      expect(@dealership_2.alphabetical_order).to eq([@car_3, @car_2])
    end

    it 'can return cars limited by year' do
      expect(@dealership_2.year_limit(2000).include?(@car_1)).to eq false
    end

    it 'can return dealerships sorted by amount of cars' do
      expect(Dealership.order_by_car_count).to eq([@dealership_2, @dealership_1])
    end
  end
end