class Movies < ActiveRecord::Base
	has_one :rentals, dependent: :destroy
	validates :year_of_release, :numericality => {:greater_than => 1940 }
end
