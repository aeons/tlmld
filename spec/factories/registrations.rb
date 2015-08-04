FactoryGirl.define do
  factory :registration do
    association :event
    name 'Tester T. McTestson'
    email 'tester@example.com'
    registered_at 1.day.ago
    deregistered_at nil
    paid false
  end

end
