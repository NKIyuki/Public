class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new
    @item = Item.all
    @genres = Genre.all

  end

  def show
    @item = Item.find(params[:id])

  end

  def index
    @items = Item.all
    @item = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_active,:image)
  end
end