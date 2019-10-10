# frozen_string_literal: true

FactoryBot.define do
  factory :like, aliases: %i[liked_posts] do
    user_id { nil }
    post_id { nil }
  end
end
