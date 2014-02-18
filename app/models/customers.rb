class Customers < ActiveRecord::Base
	validates :movie_name, :presence => true, allow_blank: false
end
