class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_detail
  
  enum payment_method: { credit_card: 0, transfer: 1 }

  enum delivery_method: { customer_address: 0, delivery_address: 1, new_address:2 }

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
  
  def subtotal
    amount*item.with_tax_price.to_i
  end
end
