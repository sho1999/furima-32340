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


### Association

- has_many :items, through: item_users
- has_many :item_user

## items テーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| name          | string  | null: false |
| text          | text    | null: false |
| category      | string  | null: false |
| state         | string  | null: false |
| postage       | string  | null: false |
| region        | string  | null: false |
| shipping_date | string  | null: false |
| price         | integer | null: false |


### Association

- has_many :users, through: item_users
- has_many :item_user

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## buys テーブル

| Column       | Type    | Options     |
| ------------ | --------| ------------|
| postal_code  | string  | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

