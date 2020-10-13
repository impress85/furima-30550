# furimaのテーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | text   | null: false |

### Association
- has_one  :user_profile
- has_many :items
- has_many :transactions


## user_profiles テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| nickname             | string    | null: false                    |
| first_name           | string    | null: false                    |
| first_name_katakana  | char      | null: false                    |
| family_name          | string    | null: false                    |
| family_name_katakana | char      | null: false                    |
| birthday             | date      | null: false                    |
| user-id              | reference | null: false, foreign_key: true |

### Association
- belongs_to :user


## items テーブル

| Column   | Type          | Options                        |
| -------- | ------------- | ------------------------------ |
| item     | string        | null: false                    |
| image    | ActiveStorage | null: false                    |
| price    | int           | null: false                    |
| describe | text          | null: false                    |
| user_id  | reference     | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :transaction
- has_one :item_detail

## item_details テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| category            | ActiveHash | null: false                    |
| item_condition      | text       | null: false                    |
| shipping_cost_payer | ActiveHash | null: false                    |
| shipment_source     | ActiveHash | null: false                    |
| shipping_days       | ActiveHash | null: false                    |
| item_id             | reference  | null: false, foreign_key: true |

### Association
- belongs_to :item


## transactions テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :credit_card
- has_one :destination


## credit_cards テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| credit_number   | int       | null: false                    |
| expiration_date | int       | null: false                    |
| security_code   | int       | null: false                    |
| transaction_id  | reference | null: false, foreign_key: true |

### Association
- belongs_to :transactions


## destinations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | int        | null: false                    |
| prefectures    | ActiveHash | null: false                    |
| municipality   | char       | null: false                    |
| address        | char       | null: false                    |
| building_name  | string     | null: true                     |
| phone_number   | int        | null: false                    |
| transaction_id | reference  | null: false, foreign_key: true |

### Association
- belongs_to :transaction
