# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| password           | string | null: false              |
| katakananame       | string | null: false              |
| birthday           | string | null: false              |

## items テーブル

| Column      | Type       | Options      |
| ------      | ------     | -----------  |
| title       | string     | null: false  |
| description | text       | null: false  |
| category    | string     | null: false  |
| price       | integer    | null: false  |

## orders テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| card_token       | integer    | null: false                    |
| expiration       | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| postal_code      | integer    | null: false                    |
| card_holder_name |string      | null: false                    |
