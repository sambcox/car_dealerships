class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new

  end

  def create
    car = Car.new({
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
  end

  def show
    @car = Car.find(params[:id])
  end
end