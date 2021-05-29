class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image_name1, ImageName1Uploader

  validates :country, {presence:true}
  validates :howlong, {presence:true}
  validates :visa, {presence:true}
  validates :schoolname, {presence:true}
  validates :user_id, {presence:true}
end