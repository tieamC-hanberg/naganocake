class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def subtotal
    amount*item.with_tax_price.to_i
  end


end