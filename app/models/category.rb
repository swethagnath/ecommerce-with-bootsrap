class Category < ApplicationRecord 
	acts_as_tree order: 'created_at'
	validates_presence_of :name
	validates_uniqueness_of :name
	has_many :products
end
