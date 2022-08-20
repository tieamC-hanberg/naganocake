class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
    def item_params
      params.require(:item).permit(:page)
    end
end
