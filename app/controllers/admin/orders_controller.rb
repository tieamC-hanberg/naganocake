class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_homes_top_path(@order)
  end
  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :first_name, :last_name, :amount, :item_id, :freight, :total_payment, :order_status)
  end
end
