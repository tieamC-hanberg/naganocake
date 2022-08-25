class Admin::OrderDetailsController < ApplicationController
  def update
    @order_dateil = OrderDetail.find(params[:id])
    @order.update(order_params)
    redirect_to admin_homes_top_path(@order)
  end

  private
  def order_dateil_params
    params.require(:order_dateil).permit(:make_status)
  end

end
