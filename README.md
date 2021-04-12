# テーブル設計

## users テーブル

|  Column              |  Type     |  Options                    |
|  ------------------  |  -------  |  -------------------------  |
|  nickname            |  string   |  null: false                |
|  email               |  string   |  null: false, unique: true  |
|  encrypted_password  |  string   |  null: false                |
|  first_name          |  string   |  null: false                |
|  last_name           |  string   |  null: false                |
|  first_name_kana     |  string   |  null: false                |
|  last_name_kana      |  string   |  null: false                |
|  birthday            |  date     |  null: false                |

### association

- has_many :products
- has_many :orders


## products テーブル

|  Column                   |  Type        |  Options                         |
|  -----------------------  |  ----------  |  ------------------------------  |
|  product_name             |  string      |  null: false                     |
|  description              |  text        |  null: false                     |
|  category_id              |  integer     |  null: false                     |
|  condition_id             |  integer     |  null: false                     |
|  delivery_cost_id         |  integer     |  null: false                     |
|  delivery_prefectures_id  |  integer     |  null: false                     |
|  delivery_day_id          |  integer     |  null: false                     |
|  price                    |  integer     |  null: false                     |
|  user                     |  references  |  null: false, foreign_key: true  |

### association

- belongs_to :user
- has_one :order

## orders テーブル

|  Column   |  Type        |  Options                         |
|  -------- |  ----------  |  ------------------------------  |
|  user     |  references  |  null: false, foreign_key: true  |
|  product  |  references  |  null: false, foreign_key: true  |


### association

- belongs_to :product
- belongs_to :user
- has_one :address



## Addresses テーブル

|  Column                   |  Type        |  Options                   |
|  -----------------------  |  ----------  |  ------------------------  |
|  postal_code              |  string      |  null: false               |
|  delivery_prefectures_id  |  integer     |  null: false               |
|  city                     |  string      |  null: false               |
|  address1                 |  string      |  null: false               |
|  address2                 |  string      |                            |
|  phone_number             |  string      |  null: false               |
|  order                    |  references  |  null: false, foreign_key  |

### Association

- belongs_to :order
