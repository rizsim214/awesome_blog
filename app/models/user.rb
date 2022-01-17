class User < ApplicationRecord
  has_many :microposts      
  has_secure_password

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  # REGEX = Regular expression
  # To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: EMAIL_REGEX },
                                      uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true


  def follow(other_user)
    Relationship.create(follower_id: id , followed_id: other_user.id)
  end 

  def relationship(other_user)
    Relationship.find_by(follower_id: id , followed_id: other_user.id)    
  end
  
  def micropost_count
    Micropost.count(:user_id)
  end
 
end
