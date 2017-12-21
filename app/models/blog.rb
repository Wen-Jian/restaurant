class Blog < ApplicationRecord
	
	belongs_to :user
  	has_many :commments, foreign_key: "blog_id", :dependent => :destroy
  	has_many :likes, foreign_key: "blog_id", :dependent => :destroy
  	belongs_to :restaurant
  	validates_presence_of :title, :description, :restaurant_id, :user_id, :hot_count, :photos
  	mount_uploader :photos, AvatarUploader

end
