class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new

  end

  def show
    @item = Item.find(params[:id])
    @items = @genre

  end

  def index
　　@items = Item.all
  end

  def edit
    @items = Item.find(params[:id])
  end

  def create

  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price)
  end
end