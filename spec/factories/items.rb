FactoryBot.define do
  factory :item do
    name                   {Faker::Commerce.product_name}
    explanation            { '商品説明' }
    category_id            { 3 } 
    condition_id           { 3 }
    cost_responsibility_id { 2 }
    prefecture_id          { 3 }
    shipping_day_id        { 2 }
    price                  { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
