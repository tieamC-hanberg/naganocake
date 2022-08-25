class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(params[:order_id])
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:make_status, :order_id, :tax_price, :amount, :item_id)
  end

  def order_params
    params.require(:order).permit(:order_id)
  end

end
