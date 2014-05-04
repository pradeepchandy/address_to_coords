require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates

    if params[:address] == ""
    @address = "the corner of Foster and Sheridan"
    else
      @address=  params[:address]
  end

    @url_safe_address = URI.encode(@address)

     @url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"


    @raw_data = open(@url).read
     @parsed_data =JSON.parse(@raw_data)

 if @parsed_data["status"]=="ZERO_RESULTS"
@formatted_address = "please enter correct address"

@latitude = "9999999999999999999"
@longitude ="9999999999999999999"
 else
   @latitude = @parsed_data["results"][0]["geometry"]["location"]["lat"]
   @longitude = @parsed_data["results"][0]["geometry"]["location"]["lng"]
   @formatted_address = @parsed_data["results"][0]["formatted_address"]
end

  end
end

