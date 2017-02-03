
Table


message
body       text
image      string
group_id   integer    t.references :group, foreign_key: true
user_id    integer    t.references :user, foreign_key: true

belongs_to: user
belongs_to: group




user
name      string      null: false
group_id  integer     t.references :group, foreign_key: true

has_many: groups, through: :relation
has_many: messages




group
name     string

has_many: users, through: :relation
has_many: messages






