class Admins::OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:climber_id, :pay_method, :order_status, :freight, :total, :ship_name, :ship_postcode, :ship_address)
  end
  def order_item_params
    params.require(:order_item).permit(:sat)
  end
end
