class Resturant < ApplicationRecord

  belongs_to :user
  has_many :blogs
  has_many :comments , through: :blogs
  has_many :evaluations


  validates_presence_of :name


end
