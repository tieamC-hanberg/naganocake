class Public::CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all
  end

  def create
      binding.pry
      if cart_item.add_item(item_id: params[:item_id], amount: params[:amount])
      else
      end
  end

  def update
      if cart_item.uodate_item(item_id: params[:item_id], amount: params[:amount])
      else
      end
  end

  def destroy
      if cart_item.delete_item(item_id: params[:item_id])
      else
      end
  end

  def destroy_all
      if cart_item.delete__all_item(item_id: params[:item_id])
      else
      end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
