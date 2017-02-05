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

#usre.rb
'has_many: messages'
'has_many: proups, through: :group_member'

#migrationファイル
't.string :name, null: false, index: true'
't.timestamps null: false'



#group
|カラム名|型|
|:-:|:-:|
|name|string|

#group.rb
'has_many: messages'
'has_many: users, through: :group_member'

#migrationファイル
't.string :name, null: false, index: true'
't.timestamps null: false'



#group_member
|カラム名|型|
|:-:|:-:|
|user_id|references|
|group_id|references|

#group_member.rb
'belongs_to: group'
'belongs_to: user'

#migrationファイル
't.references :user, foreign_key: true, index: true'
't.references :group, foreign_key: true, index: true'
't.timestamps null: false'