class User < ActiveRecord::Base
  has_many :dishpics
  has_many :user_ingredient_preferences
  has_many :ingredients, :through => :user_ingredient_preferences
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  
  validates :email, uniqueness:  true, allow_nil: true
  validates :ex_user_id, uniqueness:  true, allow_nil: true
  validates :auth_token, uniqueness: true
  
  before_create :generate_authentication_token!
  
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
  
  
end
