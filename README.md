
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|add_index, unique: true, null:false,|
|email|string|null:false|

### Association
- has_many :groups, through: members
- has_many :messages
- has_many :members

## messagesテーブル
|Column|Type|Options|
|----|----|-------|
|body|text|null: false|
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|time|integer|integer|null: false|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|----|----|------|
|name|string|null:false|

- has_many: users, through: members
- has_many: messages
- has_many: members


## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

