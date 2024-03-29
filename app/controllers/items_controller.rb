class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
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

  def show
  end

  def edit
    if  @item.user_id == current_user.id && @item.order ==nil
     else
      redirect_to root_path
     end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :detail_id, :shipping_detail_id, :shipping_day_id, :prefecture_id, :price, :image).merge( user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    item = Item.find_by(id: params[:id])
    unless item && user_signed_in? && item.user_id == current_user.id
      redirect_to action: :index
    end
  end
end