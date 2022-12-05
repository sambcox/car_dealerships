class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.find(params[:id])

    car = dealership.cars.new(car_params)

    car.save

    redirect_to "/dealerships/#{dealership.id}/cars"
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    Car.destroy(params[:id])
    redirect_to "/cars"
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.permit(:name, :available, :year, :mileage, :color, :vin)
  end
end