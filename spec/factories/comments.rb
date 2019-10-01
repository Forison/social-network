FactoryBot.define do
  factory :comment do
    user { nil }
    post { nil }
    commentary { "MyString" }
  end
end
