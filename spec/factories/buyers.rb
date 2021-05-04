FactoryBot.define do
  factory :buyer do
    id { 1 }
    email { 'buyer1@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
