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

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| name               | string  | null: false               |
| kana_family_name   | string  | null: false               | 
| kana_name          | string  | null: false               |
| birthday           | integer | null: false               |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column            | Type     | Options                         |
| ----------------- | -------- | ------------------------------- |
| user              | string   | null: false , foreign_key: true | 
| title             | string   | null: false                     |
| description       | text     | null: false                     |
| category_id       | integer  | null: false                     |
| product_status_id | integer  | null: false                     |
| shipping_fee_id   | integer  | null: false                     |

### Association
- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | string     | null: false, foreign_key: true |
| user            | string     | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user


## delivery_informations テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| postal_code      | integer   | null: false |
| prefecture_id    | integer   | null: false |
| municipality     | text      | null: false |   
| block            | text      | null: false |
| building_name    | text      |             |
| telephone_number | integer   | null: false |

### Association

- has_one :purchase



