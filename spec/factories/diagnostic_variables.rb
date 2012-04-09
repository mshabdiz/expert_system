# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :diagnostic_variable do
    name "MyString"
    value 1.5
    beef false
  end
end
