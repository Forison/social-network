# frozen_string_literal: true

# frozen_string_literal: true.
FactoryBot.define do
  factory :post do
    postcontent { 'MyString' }
    sequence(:user_id) { |n| n }
  end
end
