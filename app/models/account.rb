class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts   
  has_many :likes  
  validates_uniqueness_of :email
  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following 
    Follower.where(following_id: self.id).count
  end

end
