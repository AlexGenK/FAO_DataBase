FactoryBot.define do
  factory :simple_user, class: User do
    email                 { "simple_user@mail.no" }
    password              { "123456" }
  end
end