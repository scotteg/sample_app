FactoryGirl.define do
  factory :user do
    name 'Michael Hartl'
    email 'michale@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end