class SearchController < ApplicationController
  def index
    binding.pry
    @stores = Store.within_zip(search_params)
    
  end

  private
    def search_params
      params.permit(:search, :radius)
    end
end