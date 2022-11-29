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
end