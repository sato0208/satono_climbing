FactoryBot.define do
  factory :item do
    genre_id { 1 }
    description { "MyText" }
    item_name { "MyString" }
    item_price { 1 }
    image_id { "MyString" }
    is_sale_status { false }
  end
end
