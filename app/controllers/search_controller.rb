class SearchController < ApplicationController
  def new
    zipcode = params[:search]
    @conn = Faraday.new(:url => "https://api.bestbuy.com")
    path = URI.encode("/v1/stores(area(80202, 25))")

    # response = conn.get do |req|                           # GET http://sushi.com/search?page=2&limit=100  
    #   req.url path
    #   req.params['format'] = "json"
    #   req.params['show'] = "storeId,storeType,name"
    #   req.pageSize[]
    # end
    response = @conn.get path, {:format => "json", show: "longName,city,distance,phone,storeType", pageSize: 20, apiKey: "#{ENV['best_buy_api_key']}"}
    JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end