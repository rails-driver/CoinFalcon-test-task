FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
  end

  factory :address do
    name { 'Address name' }
  end
end
