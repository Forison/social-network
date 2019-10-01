# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentator, class_name: 'User', foreign_key: :user_id
  belongs_to :post
end
