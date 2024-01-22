class ItemsController < ApplicationController
  def index
    @item - Item.all
  end

  def  new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :detail_id, :shipping_detail_id, :shipping_day_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
  
end