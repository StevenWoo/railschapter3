FactoryGirl.define do
  factory :user do
    name     "Steven Woo"
    email    "swoo@tackable.com"
    password "foobar"
    password_confirmation "foobar"
  end
end