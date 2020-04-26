class OrdersController < ApplicationController
  def new
    @order_new = Order.new
    @ship = Ship.where(climber_id: current_climber.id)
    @my_cart = current_climber.cart_items
    if @my_cart.empty?
        redirect_to request.referer
    end
  end

 def create
    @order_new = Order.new(order_params)
    @cart_items = CartItem.where(climber_id: current_climber.id)
    # カートへ戻る
      if params[:back].present?
            render 'cart_items/index'
        return
    # 情報入力へ戻る
      elsif params[:info].present?
              @ship = Ship.where(climber_id: current_climber.id)
            render 'orders/new'
        return
      end
      if  @order_new.save
        @cart_items.each do |f|
          @order_item_new = OrderItem.new
            @order_item_new.order_id = @order_new.id
            @order_item_new.item_id = f.item.id
            @order_item_new.product_status = "製作待ち"
            @order_item_new.order_item_price = f.item.item_price
            @order_item_new.order_item_quantity = f.cart_item_quantity
            @order_item_new.order_item_name = f.item.item_name
          @order_item_new.save
        end
          @ship_new = Ship.new(climber_id: current_climber.id, code: params[:order][:ship_postcode],address: params[:order][:ship_address],name: params[:order][:ship_name])
          # @ship_new = Ship.new(ship_params)
          #  @ship_new.climber_id = current_climber.id
          #  @ship_new.code = params[:order][:ship_postcode]
          #  @ship_new.address = params[:order][:ship_address]
          #  @ship_new.name = params[:order][:ship_name]
          @ship_new.save
        current_climber.cart_items.destroy_all
        redirect_to orders_thanks_path
      else
        redirect_to new_order_path
      end
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.all
  end

  def confirm
    @freight = 800
    @cart_items = current_climber.cart_items.all
    @order_new = Order.new(order_params)
    @order_new.climber_id = current_climber.id
    @pay_method = params[:order][:pay_method]
      # 自分の配送先
      if params[:ship_num] == "1"
        @order_postcode = current_climber.post_code
        @order_address = current_climber.address
        @order_name = current_climber.name
      # 登録済みの配送先
      elsif params[:ship_num] == "2"
        @order_postcode = Ship.find(params[:ship_id]).view_ship_code
        @order_address = Ship.find(params[:ship_id]).view_ship_address
        @order_name = Ship.find(params[:ship_id]).view_ship_name
      # 新しい配送先
      else
        @order_postcode = params[:order][:ship_postcode]
        @order_address = params[:order][:ship_address]
        @order_name = params[:order][:ship_name]
        render 'orders/new' if @order_new.invalid?
      end
  end

  def thanks
  end

  def index
    @orders = Order.all
  end
    private
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :product_status, :order_item_price, :order_item_quantity, :order_item_name)
  end

  def order_params
    params.require(:order).permit(:climber_id, :pay_method, :order_status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end

  # def ship_params
  #   params.require(:ship).permit(:climber_id, :address, :name, :code)
  # end
end
