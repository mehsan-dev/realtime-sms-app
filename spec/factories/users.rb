FactoryBot.define do
  factory :user do
    first_name { "Hello" }
    last_name { "World" }
    email {"hello@gmail.com" }
    phone_number { "01234567890" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
  