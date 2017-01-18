class FixComment < ActiveRecord::Migration[5.0]
  def up
    change_column :comments, :user_id, :integer, null: true
    remove_index :comments, :user_id
    add_index :comments, :user_id, where: 'user_id is not null'
  end

  def down
    change_column :comments, :user_id, :integer, null: false
    remove_index :comments, :user_id
    add_index :comments, :user_id
  end
end
