FactoryBot.define do
  factory :post do
    postcontent { "MyString" }
    sequence(:user_id) { |n| n }
  end
end
