class Product < ApplicationRecord
	has_many :order_line_items
	has_many :wishlists
	belongs_to :category
	has_many :cart_line_items
	has_many :reviews
	validates_presence_of :name,:price,:description,:stock,:category_id
	validates_numericality_of :price,greater_than:0
	validates_numericality_of :stock,greater_than_or_equal_to:0
	validates_length_of :description,minimum:5
end
