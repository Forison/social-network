class Post < ApplicationRecord
  validates :postcontent, presence: true 
  belongs_to :author , class_name: "User", foreign_key: :user_id
end
