class Restaurant < ApplicationRecord
	
	has_many :blogs, foreign_key: "resturant_id"
  	has_many :comments , through: :blogs, foreign_key: "resturant_id"
  	has_many :evaluations, foreign_key: "resturant_id"


	validates_presence_of :name


end
