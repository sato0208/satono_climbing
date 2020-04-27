class CartItemsController < ApplicationController
  def index
    @cart_items = current_climber.cart_items.all
  end

  def create
    @cart_item_new = CartItem.new(cart_item_params)
    @cart_item_new.climber_id = current_climber.id
      if current_climber.cart_items.where(item_id: @cart_item_new.item_id).exists?
      # 個数を合算する
      @cart_item_new = current_climber.cart_items.find_by(item_id: @cart_item_new.item_id)
      # （カラムを指定　現在のアイテムの量　＋　送られてきたパラメータの値）
      @cart_item_new.update(cart_item_quantity: @cart_item_new.cart_item_quantity + params[:cart_item][:cart_item_quantity].to_i)
    else
      @cart_item_new.save
    end
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_climber.cart_items.all
    @cart_items.destroy_all
  end
 private
  def cart_item_params
    params.require(:cart_item).permit(:climber_id, :item_id, :cart_item_quantity,:cart_item_size)
  end
end