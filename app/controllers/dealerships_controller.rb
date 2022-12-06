class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc)
    @dealerships = Dealership.order_by_car_count if params[:order_by] == 'car_count'
    @dealerships = Dealership.filter_by_name(params[:name_input]) if params[:name_input]
  end

  def new

  end

  def create
    dealership = Dealership.new(dealership_params)

    dealership.save

    redirect_to '/dealerships'
  end

  def edit
    if Dealership.find_by_id(params[:id]).present?
      @dealership = Dealership.find(params[:id])
    else
      redirect_to "/errors/not_found"
    end
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
    if Dealership.find_by_id(params[:id]).present?
      @dealership = Dealership.find(params[:id])
      @car_count = @dealership.car_count
    else
      redirect_to "/errors/not_found"
    end
  end

  private
  def dealership_params
    params.permit(:name, :city, :service_department, :employees)
  end
end