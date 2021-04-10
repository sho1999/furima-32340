# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_nama      | string | null: false |
| last_name_kana  | string | null: false |
| first_nama_kana | string | null: false |
| birthday        | string | null: false |


### Association

- has_many :items
- belongs_to :receiving
- belongs_to :purchase


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| price          | string     | null: false                    |
| category       | string     | null: false                    |
| products_state | string     | null: false                    |
| delivery_fee   | string     | null: false                    |
| sending_region | string     | null: false                    |
| shipping_date  | string     | null: false                    |
| user_id        | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## purchaseテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_info     | string     | null: false                    |
| term          | string     | null: false                    |
| security_code | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## receivingテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postcode       | string     | null: false |
| receiving_area | string     | null: false |
| city           | string     | null: false |
| block          | string     | null: false |
| building       | string     | null: false |
| phone_num      | string     | null: false |

### Association

- belongs_to :user