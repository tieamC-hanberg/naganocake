class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  private
    def item_params
      params.require(:item).permit(:page)
    end
end
