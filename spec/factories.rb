FactoryGirl.define do
  factory :user do
    name     "umpf"
    email    "umpf@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end