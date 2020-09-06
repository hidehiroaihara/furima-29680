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

|  Column         | Type   | Options      |
| ----------------| ------ | ------------ |
| nickname        | string | null: false  |
| email           | string | null: false  |
| password        | string | null: false  |
| family_name     | string | null: false  |
| first_name      | string | null: false  |
| family_name_cana| string | null: false  |
| first_name_cana | string | null: false  |
| birthday        | date   | null: false  |


### Association

- has_many :products
- has_many :purchasers

## products テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| name                | string       | null: false                   |
| content             | text         | null: false                   |
| category_id         | integer      | null: false                   |
| product_condition_id| integer      | null: false                   |
| shipping_id         | integer      | null: false                   |
| delivery_fee_id     | integer      | null: false                   |
| delivery_day_id     | integer      | null: false                   |
| price               | integer      | null: false                   |
| user_id             | integer      | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| user_id             | integer      | null: false, foreign_key: true|
| product_id          | integer      | null: false, foreign_key: true|


### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| post_code           | string      | null: false                   |
| prefecture_id       | integer      | null: false                   |
| city                | string       | null: false                   |
| house_number        | string       | null: false                   |
| building            | string       |                               |
| phone_number        | string      | null: false                   |
| purchaser_id        | integer      | null: false, foreign_key: true|

### Association

-belong_to purchaser