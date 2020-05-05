# temp-app
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :records

## recordsテーブル
|Column|Type|Options|
|------|----|-------|
|value|text||
|date |text|null: false｜
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user







