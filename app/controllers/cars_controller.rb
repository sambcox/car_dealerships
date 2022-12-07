class CarsController < ApplicationController
  def index
    @cars = Car.all
    @cars = Car.filter_by_name(params[:name_input]) if params[:name_input]
  end

  def new
    if Dealership.find_by_id(params[:id]).present?
      @dealership = Dealership.find(params[:id])
    else
      redirect_to '/errors/not_found'
    end
  end

  def create
    dealership = Dealership.find(params[:id])

    car = dealership.cars.new(car_params)

    car.save

    redirect_to "/dealerships/#{dealership.id}/cars"
  end

  def edit
    if Car.find_by_id(params[:id]).present?
      @car = Car.find(params[:id])
    else
      redirect_to '/errors/not_found'
    end
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    Car.destroy(params[:id])
    redirect_to '/cars'
  end

  def show
    if Car.find_by_id(params[:id]).present?
      @car = Car.find(params[:id])
    else
      redirect_to '/errors/not_found'
    end
  end

  private

  def car_params
    params.permit(:name, :available, :year, :mileage, :color, :vin)
  end
end
