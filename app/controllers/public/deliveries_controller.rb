class Public::DeliveriesController < ApplicationController
  def index
    #@delivery = Delivery.find(params[:id])
    @deliveries = Delivery.all
    #@delivery =Delivery.new
  end

  def create
    @deliveries = Delivery.all
    @delivery = Delivery.new(delivery_params)
    @delivery.save
    redirect_to public_deliveries_path
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  private

  def delivery_params
    params.permit(:postcode, :address, :name)
  end
end
