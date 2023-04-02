class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @document_address = DocumentAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @document_address = DocumentAddress.new(document_params)
    if @document_address.valid? 
      @document_address.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def document_params
    params.require(:document_address).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
