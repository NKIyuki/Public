class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.page(params[:page])
  end
  private
     def item_params
      params.require(:items).permit(:genre_id,:name,:introduction,:image_id,:price)
     end

end
