class Api::V1::ItemsController < ApiBaseController
  before_action :set_item, only: [:show, :destroy]
  
  def index
    render json: Item.all
  end

  def show
    render json: @item
  end
  
  def destroy
    if @item.destroy
      render :nothing => true, :status => 204
    end  
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, :status => 201
    end
  end

  private
  
    attr_reader :item

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end