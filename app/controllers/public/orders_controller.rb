class Public::OrdersController < ApplicationController
  def complete
  end
  
  def comfilm
    @order = Order.new(order_params)
    binding.pry
  end
  
  def index
  end
  
  def new
  end
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method)
  end
  
end
