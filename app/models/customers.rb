class Customers < ActiveRecord::Base
	validates :name, :presence => true, allow_blank: false
	validates :mobile, :presence => true, allow_blank: false
	validates :address, :presence => true, allow_blank: false
	validates :movie_name, :presence => true, allow_blank: false
	validates :mobile, length: { is: 10}
end
