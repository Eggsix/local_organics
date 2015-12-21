require 'json'
require 'net/http' #to make a GET request
require 'open-uri' #to fetch the data from the URL to then be parsed by JSON
class HomeController < ApplicationController

	@@zipcode = 98133
	@@location = Geocoder.coordinates("seattle")
	def index
		@location = @@location
		@market = []
		uri = URI("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=#{@@zipcode}")
		res = Net::HTTP.get_response(uri)
		@markets = JSON.load(res.body)
		@markets['results'].each do |x|
			uri2 = URI("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=#{x['id']}")
			res2 = Net::HTTP.get_response(uri2)
			details = JSON.load(res2.body)
			coordinates = Geocoder.coordinates(details["marketdetails"]["Address"])
			market_name = x["marketname"].slice(4, x["marketname"].length-1)
			@market << [market_name, coordinates, details]
		end
		
	end

	def set_zipcode
		@@location = Geocoder.coordinates(params[:search])
		@@zipcode = params[:search]
		redirect_to root_url
	end


end
