class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]

  def index
    @document_address = DocumentAddress.new
    if current_user.id == @item.user_id || @item.document.present?
      redirect_to root_path
    end
  end

  def create
    @document_address = DocumentAddress.new(document_params)
    if @document_address.valid? 
      pay_item
      @document_address.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def document_params
    params.require(:document_address).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: document_params[:token],
      currency: 'jpy'
    )
  end
    
end
