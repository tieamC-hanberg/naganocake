class OrderDetail < ApplicationRecord
  belongs_to :order_params
  belongs_to :item
end
