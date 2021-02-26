# テーブル設計

## Users テーブル

|  Column            |  Type     |  Options                 |
|  ----------------- |  -------  |  ----------------------  |
|  nickname          |  string   |  NOT NULL                |
|  email             |  string   |  NOT NULL, unique: true  |
|  password          |  string   |  NOT NULL                |
|  first_name        |  string   |  NOT NULL                |
|  last_name         |  string   |  NOT NULL                |
|  first_name_kana   |  string   |  NOT NULL                |
|  last_name_kana    |  string   |  NOT NULL                |
|  birthday          |  string   |  NOT NULL                |

### Association

- has_many :products
- has_many :orders


## Products テーブル

|  Column           |  Type        |  Options                      |
|  ---------------- |  ----------  |  ---------------------------  |
|  product_name     |  string      |  NOT NULL                     |
|  image            |  null        |  NOT NULL, unique: true       |
|  description      |  string      |  NOT NULL                     |
|  category         |  string      |  NOT NULL                     |
|  condition        |  string      |  NOT NULL                     |
|  delivery_cost    |  string      |  NOT NULL                     |
|  delivery_source  |  string      |  NOT NULL                     |
|  delivery_day     |  string      |  NOT NULL                     |
|  price            |  string      |  NOT NULL                     |
|  user             |  references  |  NOT NULL, foreign_key: true  |

### Association

- belongs_to :users
- has_one :orders

## Orders テーブル

|  Column   |  Type        |  Options                |
|  -------- |  ----------  |  ---------------------  |
|  user     |  references  |  NOT NULL, foreign_key  |
|  product  |  references  |  NOT NULL, foreign_key  |


### Association

- has_many :products
- belongs_to :users
- has_one :addresses

## Addresses テーブル

|  Column        |  Type    |  Options   |
|  --------------|  ------  |  --------  |
|  postal_code   |  string  |  NOT NULL  |
|  prefectures   |  null    |  NOT NULL  |
|  city          |  string  |  NOT NULL  |
|  address1      |  string  |  NOT NULL  |
|  phone_number  |  string  |  NOT NULL  |

### Association

- has_one :orders