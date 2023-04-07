FactoryBot.define do
  factory :document_address do
    post_code { "111-1111" }
    prefecture_id { 3 }
    municipalities { "北市" }
    house_number { "1-1" }
    building { "南ハイツ" }
    phone_number { "09011111111" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
