class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "paid_up"
       @order_details.update_all(make_status: "waitingproduction")
    end
    redirect_to admin_order_path
  end
  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :first_name, :last_name, :amount, :item_id, :freight, :total_payment, :order_status, :make_status)
  end

end
