# frozen_string_literal: true

# frozen_string_literal: true.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  default_scope { order(created_at: :desc) }
  before_save :capitalize_names
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
  has_many :friendships
  has_many :inverted_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  scope :all_except, ->(me) { where.not(id: me) }
  def names
    "#{lastname} #{firstname}"
  end
  def all_friends
    receive_request = inverted_friendships.where(confirmed: 'true')
    sent_request    = friendships.where(confirmed: 'true')
    receive_request + sent_request
  end
  def approved_friend
    all_friends.map { | a | a.user_id }
  end
  def find_friend(hello)
    User.find( hello )
  end
  private
  def capitalize_names
    self.lastname = lastname.capitalize
    self.lastname = firstname.capitalize
  end
end
