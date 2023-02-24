class Public::AddressesController < ApplicationController
  def index
     @addresses = Addresses.all
  end

  def edit
    @addresses = Addresses.faind(params[:id])
  end
end
