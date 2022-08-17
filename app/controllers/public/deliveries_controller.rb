class Public::DeliveriesController < ApplicationController
  def index
    #@delivery = Delivery.find(params[:id])
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.find(params[:id])
    #@post_image.user_id = current_user.id
    @delivery.save
    redirect_to public_deliveries_path
    @deliveries = Delivery.all
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end
end
