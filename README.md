
## usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|name|string|add_index, unique: true, null:false,|
|email|string|null:false|

### Association

## messagesテーブル
|Column|Type|Options|
|----|----|-------|
|body|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|time|integer|integer|null: false|

### Association

## groupsテーブル
|Column|Type|Options|
|----|----|------|
|name|string|null:false|



## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

