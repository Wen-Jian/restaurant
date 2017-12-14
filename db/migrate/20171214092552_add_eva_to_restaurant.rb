class AddEvaToRestaurant < ActiveRecord::Migration[5.1]
  def change

  	add_column :restaurants, :eva, :integer

  end
end
