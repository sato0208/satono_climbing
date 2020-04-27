class Admins::SizesController < ApplicationController
  def index
    @size_new = Size.new
    @sizes = Size.all
  end

  def update
    @size = Size.find(params[:id])
    @size.update(size_params)
    redirect_to admins_sizes_path
  end

  def create
    size = Size.new(size_params)
    size.save
    redirect_to admins_sizes_path
  end

  def edit
    @size = Size.find(params[:id])
  end

 private
    def size_params
      params.require(:size).permit(:size,:is_active_size)
    end
end
