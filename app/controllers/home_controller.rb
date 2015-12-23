require 'json'
require 'net/http' #to make a GET request
require 'open-uri' #to fetch the data from the URL to then be parsed by JSON
class HomeController < ApplicationController

	@@zipcode = 98133
	def index
		@area = Geocoder.coordinates(@@zipcode)
		@market = []
		uri = URI("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=#{@@zipcode}")
		res = Net::HTTP.get_response(uri)
		markets = JSON.load(res.body)
		markets['results'].each do |x|
			uri2 = URI("http://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=#{x['id']}")
			res2 = Net::HTTP.get_response(uri2)
			details = JSON.load(res2.body)
			market_name = x["marketname"].slice(4, x["marketname"].length-1)
			if !Market.find_by(name: "#{market_name}")
				coordinates = Geocoder.coordinates(details["marketdetails"]["Address"])
				market = Market.create(name: "#{market_name}", 
							  address: "#{details['marketdetails']['Address']}", 
							  products: "#{details['marketdetails']['Products']}", 
							  schedule: "#{details['marketdetails']['Schedule']}",
							  latitude: coordinates[0],
							  longitude: coordinates[1])
				@market << market
			else 
				market = Market.find_by(name: "#{market_name}")
				@market << market
			end
		end
	end

	def set_zipcode
		@@zipcode = params[:search]
		redirect_to root_url
	end


end
