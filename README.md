#messagesテーブル
|カラム名|型|
|:-:|:-:|
|body|text|
|image|string|
|group_id|references|
|user_id|references|

#message.rb
'belongs_to: user'
'belongs_to: group'

#migrationファイル
 t.text   :body  
 t.string :image  
 t.references :user, foreign_key: true, index: true  
 t.references :group, foreign_key: true, index: true  
 t.timestamps null: false



#usersテーブル
|カラム名|型|
|:-:|:-:|
|name|string|

#user.rb
'has_many: messages'
'has_many: users_groups'
'has_many: groups, through: :users_groups, dependent: :destroy'

#migrationファイル
't.string :name, null: false, index: true  
 t.timestamps null: false'



#groupsテーブル
|カラム名|型|
|:-:|:-:|
|name|string|

#group.rb
'has_many: messages
 has_many: users_groups
 has_many: users, through: :users_groups, dependent: :destroy'

#migrationファイル
 t.string :name, null: false, index: true  
 t.timestamps null: false



#users_groupsテーブル
|カラム名|型|
|:-:|:-:|
|user_id|references|
|group_id|references|

#users_group.rb
'belongs_to: group'
'belongs_to: user'

#migrationファイル
t.references :user, foreign_key: true, index: true  
t.references :group, foreign_key: true, index: true  
t.timestamps null: false