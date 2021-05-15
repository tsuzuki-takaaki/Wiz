class User < ApplicationRecord

  has_many :posts,  dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password

  validates :name, {presence:true}
  validates :email, {presence:true, uniqueness:true}

  def posts
    return Post.where(user_id: self.id)
  end
end