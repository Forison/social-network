# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user_id { nil }
    post_id { nil }
    commentary { 'MyString' }
  end
end
