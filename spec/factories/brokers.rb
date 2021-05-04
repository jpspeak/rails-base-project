FactoryBot.define do
  factory :broker do
    id { 1 }
    email { 'broker1@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }

    trait :confirmed do
      confirmed_at { 2.days.from_now }
      confirmation_sent_at { 3.days.from_now }
    end

    trait :approved do
      approved_at { 1.day.from_now }
    end
  end
end
