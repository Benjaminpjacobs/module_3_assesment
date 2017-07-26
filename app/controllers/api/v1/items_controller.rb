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
        status: 200,
        message: "Item #{item.id} successfully delete",
      }, :status => 200
    end  
  end
end