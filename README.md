# DB

## usersテーブル

|Column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|address_id|integer|null: false, foreign_key: true|
|credit_card_id|integer|null: false, foreign_key: true|

### Association

- has_one :address
- has_one :credit_card
- has_many :items
- has_many :buyings

## addressesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone|integer||

### Association

- has_one :user
- has_many :buyings

## credit_cardsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, unique: true|
|exp_month|integer|null: false|
|exp_year|integer|null: false|

### Association

- has_one :user
- has_many :buyings

## buyingsテーブル

|Column|Type|Option|
|------|----|------|
|buyer_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|
|credit_card_id|integer|null: false, foreign_key: true|
|amount|integer|null: false|

### Association

- belongs_to :user
- belongs_to :address
- belongs_to :credit_card
- has_one :item

## itemsテーブル

|Column|Type|Option|
|------|----|------|
|seller_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|bland_id|integer|foreign_key: true|
|condition|string|null: false|
|postage_payment|string|null: false|
|ship_from|string|null: false|
|preparation|string|null: false|
|price|integer|null: false|

### Association

- belongs_to :user
- has_one :buying
- has_many :images
- belongs_to :category
- belongs_to :bland

## imagesテーブル

|Column|Type|Option|
|------|----|------|
|item_id|integer|null: false, foreign_key: true|
|picture|string|null: false|

### Association

- belongs_to :item

## categoriesテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|parent_id|integer|null: false, foreign_key: true, default: ''|

### Association

- has_many :items

## blandsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association

- has_many :items
