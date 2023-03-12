class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order = Order.all
  end


  def update

  end

end
