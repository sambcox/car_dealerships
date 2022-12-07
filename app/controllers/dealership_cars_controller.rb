class DealershipCarsController < ApplicationController
  def index
    redirect_to '/errors/not_found' if Dealership.where(id: params[:id]) == []
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @cars = @dealership.alphabetical_order if params[:order_by] == 'alphabetical'
    @cars = @dealership.year_limit(params[:year]) if params[:year]
  end

  def destroy
    Car.destroy(params[:car_id])
    redirect_to "/dealerships/#{params[:dealership_id]}/cars"
  end
end
