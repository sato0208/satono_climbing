class CartItem < ApplicationRecord
  belongs_to :climber
  belongs_to :item
end
