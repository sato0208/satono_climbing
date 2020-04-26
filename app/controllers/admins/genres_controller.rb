class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre_new = Genre.new
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
      redirect_to admins_genres_path, notice: "successfully created Genre!"
  end

  def create
    @genre_new = Genre.new(genre_params)
    if @genre_new.save
      redirect_to request.referer
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

 private
  def genre_params
    params.require(:genre).permit(:genre_name, :is_active)
  end
end