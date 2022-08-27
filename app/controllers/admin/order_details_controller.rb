class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.make_status == "productionnow"
       @order_detail.order.update(order_status: "production")
    elsif @order.order_details.count == @order.order_details.where(make_status: "complete" ).count
       @order_detail.order.update(order_status: "preparing")
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:make_status, :order_id, :tax_price, :amount, :item_id)
  end

  def order_params
    params.require(:order).permit(:order_id)
  end

end
