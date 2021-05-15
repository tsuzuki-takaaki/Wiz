class Post < ApplicationRecord

  belongs_to :user
  has_many :likes
  has_many :comments, dependent: :destroy

  validates :country, {presence:true}
  validates :howlong, {presence:true}
  validates :visa, {presence:true}
  validates :schoolname, {presence:true}
  validates :user_id, {presence:true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end