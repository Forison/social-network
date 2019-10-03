# frozen_string_literal: true

# frozen_string_literal: true.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :dob, presence: true
  validates :gender, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many_attached :avatar, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post'

  # def user_like_post?(one, two, three)
  #   return true if Like.where(status: one).where(user_id: two).where(post_id: three).exists?
  #   false
  # end

  # def unlike_id(one, two, three)
  #   Like.where(status: one).where(user_id: two).where(post_id: three).ids
  # end
end
