# frozen_string_literal: true

# frozen_string_literal: true.
class Post < ApplicationRecord
  validates :postcontent, presence: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many_attached :avatar, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope { order(created_at: :desc) }
end
