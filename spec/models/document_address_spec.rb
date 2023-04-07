require 'rails_helper'

RSpec.describe DocumentAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @document_address = FactoryBot.build(:document_address, user_id: @user, item_id: @item)
    sleep 0.1
  end
  
  describe '商品購入機能' do

    context '商品を購入できる時' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@document_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @document_address.building = ''
        expect(@document_address).to be_valid
      end
    end

    context '商品を購入できない時' do
      it 'post_codeが空では保存できない' do
        @document_address.post_code = ''
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが1では保存できない' do
        @document_address.prefecture_id = 1
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @document_address.municipalities = ''
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @document_address.house_number = ''
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @document_address.phone_number = ''
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では保存できない' do
        @document_address.token = nil
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Token can't be blank")
      end 
      it 'post_codeは半角のハイフンを含む正しい形式でなければ保存できない' do
        @document_address.post_code = '12345678'
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'phone_numberは9文字以下では保存できない' do
        @document_address.phone_number = '090123456'
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは12文字以上では保存できない' do
        @document_address.phone_number = '090123456789'
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角数字でなければ保存できない' do
        @document_address.phone_number = '０９０１２３４５６７８' 
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐づいていなければ保存できない' do
        @document_address.user_id = nil
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ保存できない' do
        @document_address.item_id = nil
        @document_address.valid?
        expect(@document_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
