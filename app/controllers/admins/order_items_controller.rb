class Admins::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_params)
    # each_with_indexでindexに番号を振る？分からないから調べてやり直す
        @order_item.order.order_items.each_with_index do |o_i, index|
    # order_itemsのproduct_statusが製作完了ではないとき
    unless o_i.product_status=="製作完了"
      break
       end
       if index == @order_item.order.order_items.size - 1
    # order_itemsのproduct_statusが製作完了になったらstatusを発送準備中にする
        @order_item.order.update(order_status: "発送準備中")
      end
    end
    redirect_to admins_order_path(@order_item.order.id)
  end

  private
    def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :product_status,:order_item_price,:order_item_quantity,:order_item_name,:order_item_size)
  end
end
