class Public::OrdersController < ApplicationController
  def complete
  end

  def comfilm
  end

  def index
  end

  def new
    @order = Order.new
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def create
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_id, :postcode, :address, :name, :first_name, :last_name)
  end

end
