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

# mercari DB設計

## usersテーブル
|Column|Type|Option|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name_first|string|null: false|
|name_middle|string|null: false|
|name_last|string|null: false|
|name_first_kana|string|null: false|
|name_middle_kana|string|null: false|
|name_last_kana|string|null: false|
|nickname|string|null: false|
|birthday|string|null: false|
|status|integer|null: false|
### Association
- has_many  :products
- has_many  :likes  dependent: :destroy
- has_many  :comments  dependent: :destroy
- has_many  :messages  dependent: :destroy
- has_many  :alerts  dependent: :destroy
- has_many  :orders  dependent: :destroy
- has_one :address  dependent: :destroy

## addressesテーブル
|Column|Type|Option|
|------|----|-------|
|postal_code|integer|null: false|
|country|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|name|string|null: false|
|last_name|string|null: false|
|tell|string|unique: true|
### Association
- belongs_to  :user

## productsテーブル
|Column|Type|Option|
|------|----|-------|
|name|string|null: false|
|condition|string|null: false|
|price|integer|null: false|
|deu_time|string|null: false|
|brand_id|references|null: false <br> foreign_key: true|
|shipping_id|references|null: false|
|cotegory_id|references|null: false<br> foreign_key: true|
|user_id|references|null: false <br> foreign_key: true|

### Association
- belongs_to  :user
- belongs_to  :category
- belongs_to  :brand
- has_many  :likes  dependent: :destroy
- has_many  :comments  dependent: :destroy
- has_many  :messages  dependent: :destroy
- has_one  :shipping  
- has_many  :evaluations
- has_many  :images  dependent: :destroy
- has_many  :alerts  dependent: :destroy
- has_many  :orders

## imagesテーブル
|Column|Type|Option|
|------|----|-------|
|image_url|text|null: false|
|products_id|references|null: false|

### Association
- belongs_to  :product

## brandsテーブル
|Column|Type|Option|
|------|----|-------|
|category_id|references|null: false|
|name|string|null: false|

### Association
- has_many  :products
- belongs_to  :category

## categorysテーブル
|Column|Type|Option|
|------|----|-------|
|name|string|null: false|
|path|text|null: false|
|ancestry|string|null: false|

### Association
- has_many  :brands
- has_many  :products

## products-categorysテーブル
|Column|Type|Option|
|------|----|-------|
|category_id|references|null: false <br> foreign_key: true|
|products_id|references|null: false <br> foreign_key: true|

### Association
- belongs_to  :product
- belongs_to  :category

## messageテーブル
|Column|Type|Option|
|------|----|-------|
|user_id|references|null: false <br> foreign_key: true|
|product_id|references|null: false <br> foreign_key: true|
|text|text|null: false|

### Association
- belongs_to  :user
- belongs_to  :product

## commentsテーブル
|Column|Type|Option|
|------|----|-------|
|user_id|references|null: false <br> foreign_key: true|
|product_id|references|null: false <br> foreign_key: true|
|text|text|null: false|

### Association
- belongd_to  :user
- belongs_to  :product 

## shippingsテーブル
|Column|Type|Option|
|------|----|-------|
|fee_burden|string|null: false|
|shipping_time|string|null:false|

### Association
- belongs_to  :product

## evaluationsテーブル
|Column|Type|Option|
|------|----|-------|
|product_id|references|null: false <br> foreign_key: true|
|user_id|references|null: false <br> foreign_key: true|
|text|text|null: false|
|rate|string|null: false|

### Association
- belongs_to  :product
- belongs_to  :user
- has_one  :comment

## likesテーブル
|Column|Type|Option|
|------|----|-------|
|user_id|references|null: false <br> foreign_key: true|
|product_id|references|null: false <br> foreign_key: true|

### Association
- belongs_to  :product
- belongs_to  :user

## alertsテーブル
|Column|Type|Option|
|------|----|-------|
|user_id|references|null: false <br> foreign_key: true|
|product_id|references|null: false|

### Association
- belongs_to  :product
- belongs_to  :user

## odersテーブル
|Column|Type|Option|
|------|----|-------|
|user_id|references|null: false <br> foreign_key: true|
|product_id|references|null: false|

### Association
- belongs_to  :product
- belongs_to  :user



