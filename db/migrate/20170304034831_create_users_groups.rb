class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :user, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
