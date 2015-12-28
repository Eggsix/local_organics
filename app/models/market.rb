class Market < ActiveRecord::Base
	has_many :reviews
	ratyrate_rateable "market"
end
