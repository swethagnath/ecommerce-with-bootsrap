class Review < ApplicationRecord
	ratyrate_rateable 'rating'
	belongs_to :product
	belongs_to :user
	validates_presence_of :body,:product_id,:rating,:user_id
	validates_length_of :body,within:1..1000
end
