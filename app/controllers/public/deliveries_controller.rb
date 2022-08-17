class Public::DeliveriesController < ApplicationController
  def index
    @deliverie = Deliverie.find(params[:id])
    @deliveries = Deliverie.all
  end
  
  def create
    @deliverie = Deliverie.find(params[:id])
    @deliveries = Deliverie.all
  end
  
  def edit
  end
  
  private

  def deliverie_params
    params.require(:deliverie).permit(:postcode, :address, :name)
  end
end
