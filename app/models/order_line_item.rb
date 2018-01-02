class OrderLineItem < ApplicationRecord
	belongs_to :product
	belongs_to :order
	validates_presence_of :quantity,:price,:order_id,:product_id
end
