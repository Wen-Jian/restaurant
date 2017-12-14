class CreateCommments < ActiveRecord::Migration[5.1]
  def change
    create_table :commments do |t|
      t.string :commenter
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
    add_index :commments, :user_id
    add_index :commments, :blog_id
    add_index :blogs, :restaurant_id
  end
end
