class Public::HomesController < ApplicationController
  def top
    @genres = Genre.page(params[:page])
    @items = Item.order('id DESC').limit(4)

  end

  def about


  end
end
