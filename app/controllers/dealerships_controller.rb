class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc)
  end

  def new

  end

  def create(info)
    dealership = Dealership.new(info)

    dealership.save
  end

  def show
    @dealership = Dealership.find(params[:id])
    @car_count = @dealership.car_count
  end
end