class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  
  def admin?
      self.role == "admin"
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resturants
  has_many :blogs
  has_many :comments
  has_many :likes
  has_many :evaluations


  validates_presence_of :name

       def first_name
         self.name.split.first
       end
       def last_name
         self.name.split.last_name
       end



end
