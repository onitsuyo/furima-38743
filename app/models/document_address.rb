class DocumentAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number, :document_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :house_number
    validates :phone_number, numericality: {only_integer: true, length: { minimum: 10, maximum: 11 }}
    validates :token
  end

  def save
    document = Document.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building: building, phone_number: phone_number, document_id: document.id)
  end
end