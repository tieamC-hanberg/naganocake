class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order.update(order_detail_params)
    redirect_to admin_order_path(order_detail)
  end

  private
  def order_dateil_params
    params.require(:order_dateil).permit(:make_status, :order_id, :tax_price, :amount, :item)
  end

end
