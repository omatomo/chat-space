
Table                 index or null

message
body       text
image      string
group_id   integer    foreign_key: true
user_id    integer    foreign_key: true

belongs_to: user
belongs_to: group


user
name      string      null: false
group_id  integer     foreign_key: true

belongs_to: group
has_many: messages


group
name     string       foreign_key: true

has_many: users
has_many: messages