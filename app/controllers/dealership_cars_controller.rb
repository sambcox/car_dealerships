class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @cars = @cars.order(Arel.sql("lower(name)")) if params[:order_by] == 'alphabetical'
    @cars = @cars.where("year > #{params[:year]}") if params[:year]
  end

  def destroy
    Car.destroy(params[:car_id])
    redirect_to "/dealerships/#{params[:dealership_id]}/cars"
  end
end