# frozen_string_literal: true

# frozen_string_literal: true.
FactoryBot.define do
  factory :user, aliases: %i[author commentator] do
    lastname { 'addo' }
    firstname { 'kofi' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    dob { '12/12/1900' }
    gender { 'male' }
    password { 'ammorethansix' }
    password_confirmation { 'ammorethansix' }
    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new(Rails.root.to_s + '/spec/support/assets/test.jpg', 'img/jpg') }
    end
  end
end
