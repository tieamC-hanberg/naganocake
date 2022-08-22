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
    #@order.name = current_customer.first_name + current_customer.last_name
    #@delivery = Delivery.find(params[:order][:delivery_id])
    #@delivery.postcode = current_customer.postcode
    #@delivery.address = current_customer.address
    #@delivery.name = current_customer.last_name + current_customer.first_name
  end

  def create
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_id, :postcode, :address, :name)
  end

end
