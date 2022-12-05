class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc)
  end

  def new

  end

  def create
    dealership = Dealership.new(dealership_params)

    dealership.save

    redirect_to '/dealerships'
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update(dealership_params)
    dealership.save
    redirect_to "/dealerships/#{dealership.id}"
  end

  def destroy
    Dealership.find(params[:id]).cars.destroy_all
    Dealership.destroy(params[:id])
    redirect_to '/dealerships'
  end

  def show
    @dealership = Dealership.find(params[:id])
    @car_count = @dealership.car_count
  end

  private
  def dealership_params
    params.permit(:name, :city, :service_department, :employees)
  end
end