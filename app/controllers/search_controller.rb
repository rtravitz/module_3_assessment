class SearchController < ApplicationController
  def index
    zipcode = params["zipcode"]
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=phone,city,distance,storeType,name&apiKey=#{ENV['bestbuy_key']}")
    @stores = JSON.parse(response.body, symbolize_names: true)
  end
end
