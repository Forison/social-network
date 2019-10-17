# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  default_scope { order(created_at: :desc) }
  before_save :capitalize_names

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

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

  def sent_and_received_requests
    receive_request = inverted_friendships.where(confirmed: 'true')
    sent_request = friendships.where(confirmed: 'true')
    receive_request + sent_request
  end

  def approved_friend
    me = sent_and_received_requests.map(&:user_id)
    you = sent_and_received_requests.map(&:friend_id)
    (me + you).uniq - [id]
  end

  def mutual_friend(myfriend)
    me = approved_friend
    you = myfriend.approved_friend
    me & you
  end

  def mutual_friend_count(myfriend)
    mutual_friend(myfriend).count
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.lastname = auth.info.last_name
      user.firstname = auth.info.first_name
    end
  end

  private

  def capitalize_names
    self.lastname = lastname.capitalize
    self.firstname = firstname.capitalize
  end
end
