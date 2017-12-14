class AddHotCountToBlog < ActiveRecord::Migration[5.1]
  def change

  	add_column :blogs, :hot_count, :integer

  end
end
