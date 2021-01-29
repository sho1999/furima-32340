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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| image  | string  | null: false |
| name   | string  | null: false |
| text   | text    | null: false |
| price  | integer | null: false |


### Association

- belongs_to :user

## buys テーブル

| Column       | Type    | Options     |
| ------------ | --------| ------------|
| card_num     | integer | null: false |
| deadline_d   | integer | null: false |
| deadline_m   | integer | null: false |
| security_num | integer | null: false |
| postal_code  | integer | null: false |
| municipality | text    | null: false |
| address      | text    | null: false |
| building     | text    | null: false |
| phone_num    | integer | null: false |

