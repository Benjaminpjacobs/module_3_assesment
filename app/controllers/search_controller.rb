class SearchController < ApplicationController
  def index
    
    @stores = BestBuyService.within_radius({zip: params[:search], radius: 25})[:stores].map do |store|
      Store.new(store)
    end
    
  end
end