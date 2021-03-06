class BestbuyService
  def initialize
    @api_key = ENV['bestbuy_key']
    @base_url = "https://api.bestbuy.com/v1"
  end

  def stores_by_distance(zip)
    response = Faraday.get("#{@base_url}/stores(area(#{zip},25))?format=json&show=phone,storeId,city,distance,storeType,name&apiKey=#{@api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def store_info(id)
    response = Faraday.get("#{@base_url}/stores(storeId=#{id})?format=json&show=storeId,phone,city,distance,storeType,name,hours,hoursAmPm,gmtOffset,detailedHours&apiKey=#{@api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
