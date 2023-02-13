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

  def create
    genre = Genre.new(genre_params)
    genre.seve
    redirect_to 'new_admin_genre_path'
  end



  private
  def genre_params
    params.require(:genre).permit(:name)
  end


end
