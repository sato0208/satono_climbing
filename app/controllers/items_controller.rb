class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item_new = CartItem.new
    @sizes = Size.all
  end

  def top
  end


 private
  def item_params
    params.require(:item).permit(:item_name,:item_description,:item_image,:item_price,:is_sale_status,:genre_id)
  end
end