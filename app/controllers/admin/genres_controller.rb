class Admin::GenresController < ApplicationController

  def new
    @genres = Genre.new

  end


  def index
    @genres = Genre.all
  end

  def edit
    @genres = Genre.find(params[:id])
  end



  private


end
