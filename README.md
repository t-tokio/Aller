# テーブル設計

## users テーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------- | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| last_name              | string  | null: false              |
| first_name             | string  | null: false              |
| last_name_kana         | string  | null: false              |
| first_name_kana        | string  | null: false              |
| birthday               | date    | null: false              |
| sex_id                 | integer | null: false              |
| existence_id           | integer | null: false              |
| food_allergy           | string  |                          |

### Association

  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :donation_tweets
  has_many :donations
  has_many :records


## tweets テーブル

| Column         | Type        | Options                       |
| ---------------| ----------- | ----------------------------- |
| title          | string      | null: false                   |
| text           | text        | null: false                   |
| user           | references  | null: false, foreign_key: true|

### Association

  belongs_to :user
  has_many :comments
  has_likes :likes


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| tweet     | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


## records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| date          | integer    | null: false                    |
| time          | integer    | null: false                    |
| age_id        | integer    | null: false                    |
| food          | string     | null: false                    |
| quantity_id   | integer    | null: false                    |
| unit_id       | integer    | null: false                    |
| state_id      | integer    | null: false                    |
| note          | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

  belongs_to :user


## donation_tweets テーブル

| Column         | Type        | Options                       |
| ---------------| ----------- | ----------------------------- |
| title          | string      | null: false                   |
| text           | text        | null: false                   |
| user           | references  | null: false, foreign_key: true|

### Association

  belongs_to :user
  has_many :donations


## donations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| donation_tweet | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| amount_id      | integer    | null: false                    |

### Association

- belongs_to :donation_tweet
- belongs_to :user