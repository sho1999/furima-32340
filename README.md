# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_nama         | string | null: false |
| last_name_kana     | string | null: false |
| first_nama_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル
 
| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| description       | text        | null: false                    |
| price             | integer     | null: false                    |
| category_id       | integer     | null: false                    |
| state_id          | integer     | null: false                    |
| delivery_fee_id   | integer     | null: false                    |
| region_id         | integer     | null: false                    |
| shipping_date_id  | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :receive


## receivesテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| postcode          | string     | null: false |
| region_id         | integer    | null: false |
| city              | string     | null: false |
| block             | string     | null: false |
| building          | string     |             |
| phone_num         | string     | null: false |
| purchase          | references | null: false, foreign_key: true |




### Association
- belongs_to :purchase
