FactoryBot.define do
  factory :admin do
    email { 'admin1@gmail.com' }
    password { '123456' }

    trait :confirmed do
      confirmed_at { 2.days.from_now }
      confirmation_sent_at { 3.days.from_now }
    end
  end
end
