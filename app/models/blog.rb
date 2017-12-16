class Blog < ApplicationRecord
	
	belongs_to :user
  	has_many :commments, foreign_key: "blog_id"
  	has_many :likes, foreign_key: "blog_id"
  	belongs_to :restaurant
  	validates_presence_of :title, :description, :restaurant_id, :user_id, :hot_count


end
