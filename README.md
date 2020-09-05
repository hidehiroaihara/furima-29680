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
| birth_year      | integer| null: false  |
| birth_mouth     | integer| null: false  |
| birth_day       | integer| null: false  |

### Association

- has_many :products
- has_many :purchasers

## products テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| product_name        | string       | null: false                   |
| product_img_id      | references   | null: false, foreign_key: true|
| content             | text         | null: false                   |
| category_id         | integer      | null: false, foreign_key: true|
| product_condition_id| integer      | null: false, foreign_key: true|
| shipping_id         | integer      | null: false, foreign_key: true|
| delivery_fee_id     | integer      | null: false, foreign_key: true|
| delivery_day_id     | integer      | null: false, foreign_key: true|
| price               | integer      | null: false                   |
| user_id             | references   | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| user_id             | references   | null: false, foreign_key: true|
| product_id          | references   | null: false, foreign_key: true|
| card_number         | integer      | null: false                   |
| expiration_year     | integer      | null: false                   |
| expiration_mouth    | integer      | null: false                   |
| security_code       | integer      | null: false                   |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

|  Column             | Type         | Options                       |
| ------------------- | ------------ | ----------------------------- |
| post_code           | integer      | null: false                   |
| prefecture_id       | integer      | null: false, foreign_key: true|
| city                | string       | null: false                   |
| house_number        | string       | null: false                   |
| building            | string       | null: false                   |
| phone_number        | integer      | null: false                   |
| purchaser_id        | references   | null: false, foreign_key: true|

### Association

-belong_to purchaser