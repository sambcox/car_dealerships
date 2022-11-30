class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def new

  end

  def create(info)
    dealership = Dealership.new(info)

    dealership.save
  end

  def show
    @car_count = Car.where(dealership_id: params[:id]).count
    @dealership = Dealership.find(params[:id])
  end

  def show_cars
    @cars = Car.where(dealership_id: params[:id])
    @dealership = Dealership.find(params[:id])
  end
end