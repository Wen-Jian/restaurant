class Blog < ApplicationRecord
	
	belongs_to :user
  	has_many :blogs, foreign_key: "blog_id"
  	has_many :commments, foreign_key: "blog_id"
  	has_many :likes, foreign_key: "blog_id"

  	validates_presence_of :title, :description, :restaurant_id, :user_id


end
