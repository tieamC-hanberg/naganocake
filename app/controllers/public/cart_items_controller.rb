class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartTtem.new
  end

  def create
    # binding.pry
    @cart_item = CartItem.find(cart_item_params[:item_id])
    @cart_item.save
    redirect_to public_cart_items_path
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
