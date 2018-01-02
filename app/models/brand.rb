class Brand < ApplicationRecord
	validates_presence_of :url,:name
end
