# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :commentary, presence: true
  belongs_to :commentator, class_name: 'User', foreign_key: :user_id
  belongs_to :post
end
