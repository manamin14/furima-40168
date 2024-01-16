# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many  :orders

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| user               | references | null: false, foreign_kye_true  |
| title              | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| detail_id          | integer    | null: false                    |
| shipping_detail_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| user             | references | null: false, foreign_kye_true  |
| item             | references | null: false, foreign_kye_true  |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

### addressesテーブル
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city_name        | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_kye_true  |

### Association
- belongs_to :order