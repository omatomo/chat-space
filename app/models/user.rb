class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 7 }

  has_many :users_groups, dependent: :destroy
  has_many :groups, through: :users_groups
  has_many :messages, dependent: :destroy
end
