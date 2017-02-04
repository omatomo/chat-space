#comment
|カラム名|型|
|:-:|:-:|
|body|text|
|image|string|
|group_id|references|
|user_id|references|

#comment.rb
'belongs_to: user'
'belongs_to: group'

#migrationファイル
't.text   :body'
't.string :image'
't.references :user, foreign_key: true, index: true'
't.references :group, foreign_key: true, index: true'
't.timestamps null: false'



#user
|カラム名|型|
|:-:|:-:|
|name|string|
|group_id|references|

#usre.rb
'has_mamy: groups, through: :message, source: :group'
'has_many: messages'

#migrationファイル
't.string :name, null: false, index: true'
't.references :group, foreign_key: true, index: true'
't.timestamps null: false'



#group
|カラム名|型|
|:-:|:-:|
|name|string|

#group.rb
'has_many: messages'
'has_many: users'

#migrationファイル
't.string :name, null: false, index: true'
't.timestamps null: false'