class Api::V1::ItemsController < ApiBaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end
  
  def destroy
    item =  Item.find(params[:id])
    if item.destroy
      render json: {
        status: 204,
        message: "Item #{item.id} successfully delete",
      }, :status => 204
    end  
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, :status => 201
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end