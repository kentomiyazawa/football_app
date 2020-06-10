FactoryBot.define do
  factory :user do
    name                  {"aaa"}
    email                 {"aaa@aaa"}
    password              {"000000"}
    password_confirmation {"000000"}
    admin                 {"0"}
    profile               {"初めまして"}
  end
end