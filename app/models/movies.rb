class Movies < ActiveRecord::Base
	has_many :customers, dependent: :destroy
	validates :year_of_release, :numericality => {:greater_than => 1940 }
end
