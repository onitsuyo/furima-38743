class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,      null: false
      t.integer    :prefecture_id,  null: false
      t.string     :municipalities, null: false
      t.string     :house_number,   null: false
      t.string     :building
      t.string     :phone_number,   null: false
      t.references :document,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
