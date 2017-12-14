class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :level
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
    add_index :evaluations, :user_id
    add_index :evaluations, :restaurant_id
  end
end
