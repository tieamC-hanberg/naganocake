class Delivery < ApplicationRecord
  belongs_to :customers, dependent: :destroy
end
