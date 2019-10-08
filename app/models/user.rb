# frozen_string_literal: true

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
  has_many :received_but_unconfirmed, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :pending_friends, through: :received_but_unconfirmed, source: 'user'
  has_many :inverted_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  scope :all_except, ->(me) { where.not(id: me) }
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships, source: 'user'

  def names
    "#{lastname} #{firstname}"
  end

  def all_friends
    receive_request = inverted_friendships.where(confirmed: 'true')
    sent_request = friendships.where(confirmed: 'true')
    receive_request + sent_request
  end

  def approved_friend
    me = all_friends.map(&:user_id)
    you = all_friends.map(&:friend_id)
    (me + you).uniq - [id]
  end

  def find_friend(hello)
    User.find(hello)
  end

  def and_friends
    Post.where(user_id: self) + Post.where(user_id: friends)
  end

  def pending_friends_arr
    pending_friends.ids
  end

  def approved_friends_arr
    pending_friends.ids
  end

  private

  def capitalize_names
    self.lastname = lastname.capitalize
    self.firstname = firstname.capitalize
  end
end
