class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to admins_items_path
  end

  def create
    @item_new = Item.new(item_params)
    if @item_new.save
      redirect_to admins_items_path
    end
  end

  def new
    @item_new = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

 private
    def item_params
    params.require(:item).permit(:item_name,:item_description,:image,:item_price,:is_sale_status,:genre_id)
  end
end
