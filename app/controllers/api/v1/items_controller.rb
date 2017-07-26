class Api::V1::ItemsController < ApiBaseController
  def index
    binding.pry
    render json: Item.all
  end
end