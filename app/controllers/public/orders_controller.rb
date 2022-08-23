class Public::OrdersController < ApplicationController
  def complete
  end

  def confirm
    @oder = Order.new(order_params)
    @delivery = Delivery.find(params[:order][:delivery_id])
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @cart_items = CartItem.all
    @total = 0
  end

  def index
  end

  def new
    @order = Order.new
    @order.postcode = current_customer.postcode
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
  end

  def create
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :first_name, :last_name, :amount, :item_id)
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_item_id, :amount)
  end

end
