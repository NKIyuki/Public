class Admin::CustomersController < ApplicationController
  def show
    @customers = Custome.find(params[:id])
  end

  def index
    @customers = Custome.all
  end

  def edit
   @customers = Custome.find(params[:id])

  end

  def update


  end
end
