class User < ActiveRecord::Base
  has_many :dishpics
  has_many :user_ingredient_preferences
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email,  presence: true     
  validates :email, uniqueness: true
  
  
end
