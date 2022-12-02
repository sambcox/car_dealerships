class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.find(params[:id])

    car = dealership.cars.new({
      name: params[:cars][:name],
      available: params[:cars][:available],
      year: params[:cars][:year],
      mileage: params[:cars][:mileage],
      color: params[:cars][:color],
      vin: params[:cars][:vin],
      created_at: params[:cars][:created_at],
      updated_at: params[:cars][:updated_at]
    })

    car.save

    redirect_to "/dealerships/#{dealership.id}/cars"
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update({
      name: params[:cars][:name],
      available: params[:cars][:available],
      year: params[:cars][:year],
      mileage: params[:cars][:mileage],
      color: params[:cars][:color],
      vin: params[:cars][:vin],
      updated_at: Time.now
      })
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def show
    @car = Car.find(params[:id])
  end
end