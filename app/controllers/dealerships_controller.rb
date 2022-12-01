class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.order(created_at: :desc)
  end

  def new

  end

  def create
    dealership = Dealership.new({
      name: params[:dealership][:name],
      city: params[:dealership][:city],
      service_department: params[:dealership][:service_department],
      created_at: params[:dealership][:created_at],
      updated_at: params[:dealership][:updated_at],
      employees: params[:dealership][:employees]
    })

    dealership.save

    redirect_to '/dealerships'
  end

  def show
    @dealership = Dealership.find(params[:id])
    @car_count = @dealership.car_count
  end
end