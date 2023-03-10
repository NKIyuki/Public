class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  private
     def item_params
      params.require(:items).permit(:genre_id,:name,:introduction,:image_id,:price)
     end

end
