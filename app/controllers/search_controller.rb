class SearchController < ApplicationController
  def index
    zipcode = params[:search]
    @conn = Faraday.new(:url => "https://api.bestbuy.com")
    path = URI.encode("/v1/stores(area(80202, 25))")
    response = @conn.get path, {format: "json", 
                                show: "longName,city,distance,phone,storeType", 
                                pageSize: 20, 
                                apiKey: "#{ENV['best_buy_api_key']}"}

    @stores = JSON.parse(response.body, symbolize_names: true)[:stores].map do |store|
      Store.new(store)
    end
    
    
  end
end