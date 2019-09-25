class Post < ApplicationRecord
  validates :postcontent, presence: true 
  belongs_to :author , class_name: "User", foreign_key: :user_id
  has_many_attached :avatar
  scope :ordered_post,-> { order(created_at: :desc) }
end
