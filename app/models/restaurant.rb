class Restaurant < ApplicationRecord
	
	has_many :blogs, foreign_key: "restaurant_id", :dependent => :destroy
  	has_many :comments , through: :blogs, foreign_key: "resturant_id"
  	has_many :evaluations, foreign_key: "resturant_id", :dependent => :destroy


	validates_presence_of :name, :seat, :phone, :description, :photo,
      :minimum_order, :dining_time, :close_time, :open_time, :address


end
