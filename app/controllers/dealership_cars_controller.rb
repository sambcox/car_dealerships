class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @cars = @cars.order(Arel.sql('lower(name)')) if params[:order_by] == 'alphabetical'
  end
end