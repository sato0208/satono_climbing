FactoryBot.define do
  factory :order_item do
    item_id { 1 }
    order_id { 1 }
    product_status { 1 }
    order_item_price { 1 }
    order_item_quantity { 1 }
    order_item_name { "MyString" }
  end
end
