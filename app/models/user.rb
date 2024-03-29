class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  has_many :posts,  dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, {presence:true, uniqueness:true}
end