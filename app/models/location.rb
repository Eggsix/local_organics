class Location < ActiveRecord::Base
  	attr_accessor :name, :latitude, :longitude
  	geocoded_by :name
	after_validation :geocode

	def reverse_geocoded_by :latitude, :longitude do |obj,results|
	  if geo = results.first
	    obj.city    = geo.city
	    obj.zipcode = geo.postal_code
	    obj.country = geo.country_code
	  end
	end
end