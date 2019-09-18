FactoryBot.define do
  factory :user do
    lastname {'addo'}
    firstname {'kofi'}
    sequence(:email) { |n| "john#{n}@gmail.com" }
    dob {'12/12/1900'}
    gender {'male'}
    password {'ammorethansix'}
    password_confirmation {'ammorethansix'}
  end
end
