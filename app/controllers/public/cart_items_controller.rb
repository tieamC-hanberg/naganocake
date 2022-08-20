class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
    @total = 0
  end
  
  def create
    # binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(cart_item_params[:item_id])
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
       redirect_to public_cart_items_path
    else
       render '/items'
    end
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
