class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end
end