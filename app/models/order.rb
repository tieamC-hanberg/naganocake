class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment: { credit_card: 0, transfer: 1 }

  enum delivery_method: { customer_address: 0, delivery_address: 1, new_address:2 }

  enum order_status: {waiting: 0, paid_up: 1, production: 2, preparing: 3, shipped: 4}

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end

end
