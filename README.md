# furimaのテーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false |
| password             | text   | null: false |
| nickname             | string | null: false |
| first_name           | string | null: false |
| first_name_katakana  | string | null: false |
| family_name          | string | null: false |
| family_name_katakana | string | null: false |
| birthday             | date   | null: false |

### Association
- has_many :items
- has_many :order


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| price                  | int        | null: false                    |
| describe               | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_cost_payer_id | integer    | null: false                    |
| shipment_source_id     | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination


## destinations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | char       | null: false                    |
| address        | char       | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | reference  | null: false, foreign_key: true |

### Association
- belongs_to :order
