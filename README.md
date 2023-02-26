## users

| Column   | Type   | Options                   |
| ---------| ------ | ------------------------- |
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :items
- has_many :documents
- has_one :profile

## items

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| cost_responsibility | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :document

## documents

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | integer    | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| document_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :document

## profiles

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_year      | integer    | null: false                    |
| birth_month     | integer    | null: false                    |
| birth_day       | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |


### Association

- belongs_to :user



