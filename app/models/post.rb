class Post < ApplicationRecord

  validates :country, {presence:true}
  validates :howlong, {presence:true}
  validates :visa, {presence:true}
  validates :schoolname, {presence:true}
  validates :user_id, {presence:true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
end