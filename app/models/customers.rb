class Customers < ActiveRecord::Base
	validates :movie_name, :presence => true, allow_blank: false
	validates :mobile, length: { is: 10}
end
