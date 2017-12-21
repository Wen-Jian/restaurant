class Evaluation < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :level, :user_id, :restaurant_id

end
