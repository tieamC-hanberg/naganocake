class Public::OrdersController < ApplicationController
  def complete

  end

  def confirm
    @total = 0
    @order = Order.new(order_params)
    #@delivery = Delivery.find(params[:order][:delivery_id][:payment_method])
    # @order.payment_method = params[:order][:payment_method]
    @cart_items = CartItem.all
    if params[:order][:delivery_number] == "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:delivery_number] == "2"
      @order.postcode = Delivery.find(params[:order][:delivery_id]).postcode
      @order.address = Delivery.find(params[:order][:delivery_id]).address
      @order.name = Delivery.find(params[:order][:delivery_id]).name
    elsif params[:order][:delivery_number] == "3"
      @order.postcode = Order.new(order_params).postcode
      @order.address = Order.new(order_params).address
      @order.name = Order.new(order_params).name
    end
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
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all

    redirect_to public_orders_complete_path
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :first_name, :last_name, :amount, :item_id, :freight, :total_payment)
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_item_id, :amount)
  end

end
