class ItemsController < ApplicationController
  def index
  end

  def  new
    @item = Item.new
  end

  def create
    Item.new(item_params)
    redirect_to '/'
  end
  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :detail_id, :shipping_detail_id, :shipping_day_id, :prefecture_id, :price, :image)
  end
  
end