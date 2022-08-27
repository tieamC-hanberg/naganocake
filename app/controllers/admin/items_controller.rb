class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # @item.admin_id = current_admin.id
    if @item.save
        redirect_to admin_item_path(@item)
    else
        # @items = Item.all
        render "new"
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item)
    else
      render "edit"
    end
  end

  private
    def item_params
      params.require(:item).permit(:item_name, :item_description, :image, :genre_id, :price, :sale_status)
    end
end
