class Group < ApplicationRecord
   has_many :messages, dependent: :destroy
   has_many :users_groups, dependent: :destroy
   has_many :users, through: :users_groups
   accepts_nested_attributes_for :users, allow_destroy: true
   validates :group_name, presence: true
end
