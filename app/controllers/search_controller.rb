class SearchController < ApplicationController
  
  def index
    @stores = Store.within_zip(search_params).paginate :page => params[:page], :per_page => 10
  end

  private

    def search_params
      params.permit(:zip, :radius)
    end
end