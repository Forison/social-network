# frozen_string_literal: true

# frozen_string_literal: true.
FactoryBot.define do
  factory :user, aliases: [:author] do
    lastname { 'addo' }
    firstname { 'kofi' }
    email { 'tester@example.com' }
    dob { '12/12/1900' }
    gender { 'male' }
    password { 'ammorethansix' }
    password_confirmation { 'ammorethansix' }
  end
end
