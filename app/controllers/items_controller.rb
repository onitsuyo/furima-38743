class ItemsController < ApplicationController

  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all
    @items = Item.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :cost_responsibility_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
