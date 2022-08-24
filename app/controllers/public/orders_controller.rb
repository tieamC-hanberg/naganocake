class Public::OrdersController < ApplicationController
  def complete
  end

  def confirm
    @delivery = Delivery.new(delivery_params)
    @order.customer=current_customer.id
    @adress=(params[:order][:select_address])

   
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


@order = Order.new(delivery_params)
@order.customer_id=current_customer.id
@adress=(params[:order][:payment_method])
if @adress == "0"
@order.postcode = current_customer.postcode
@order.address = current_customer.address
@order.name = current_customer.first_name + current_customer.last_name
elsif @adress == "1"