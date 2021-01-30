# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :item_users

## items テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| name             | string   | null: false |
| text             | text     | null: false |
| category_id      | integer  | null: false |
| state_id         | integer  | null: false |
| postage_id       | integer  | null: false |
| region_id        | integer  | null: false |
| shipping_date_id | integer  | null: false |
| price            | integer  | null: false |


### Association

- has_many :users
- has_one :item_user

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :buys


## buys テーブル

| Column        | Type       | Options     |
| ------------- | -----------| ------------|
| postal_code   | string     | null: false |
| region_id     | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
| item_user     | references | null: false, foreign_key: true |

- belongs_to :item_user



