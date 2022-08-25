class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

   enum make_status: {impossible: 0, waitingproduction: 1, productionnow: 2, complete: 3}
end
