class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :cost_responsibility_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
