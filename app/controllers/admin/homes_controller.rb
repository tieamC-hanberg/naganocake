class Admin::HomesController < ApplicationController
  def top
    @order_details = Order_details.all
  end
  
  private
    
  def order_details_params
    params.require(:order).permit(:postcode, :address, :total_payment, :order_status, :item_id)
  end

end
