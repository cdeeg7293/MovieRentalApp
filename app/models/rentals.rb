class Rentals < ActiveRecord::Base
	belongs_to :movies
	belongs_to :customers
end
