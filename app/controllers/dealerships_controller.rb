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

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update({
      name: params[:dealership][:name],
      city: params[:dealership][:city],
      service_department: params[:dealership][:service_department],
      updated_at: Time.now,
      employees: params[:dealership][:employees]
      })
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
end