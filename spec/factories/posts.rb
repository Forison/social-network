# frozen_string_literal: true

# frozen_string_literal: true.
FactoryBot.define do
  factory :post do
    postcontent { 'MyString' }
    sequence(:user_id) { |n| n }
    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new(Rails.root.to_s + '/spec/support/assets/test.jpg', 'img/jpg') }
    end
  end
end
