class Order < ApplicationRecord
  belongs_to :customer
  has_many :deliveries
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
  
end
