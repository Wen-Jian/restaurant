class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
    	t.string :name
      	t.text :description
      	t.integer :seat
      	t.integer :minimum_order
      	t.string :phone
      	t.integer :dining_time
      	t.string :open_time
      	t.integer :close_time
      	t.text :address
      	t.string :photo
      	t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, :blog_id
    add_column :restaurants, :user_id, :integer
    add_index :restaurants, :user_id
  end
end
