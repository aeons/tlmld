FactoryGirl.define do
  factory :event do
    title 'Event title here'
    description 'Event description here'
    starts_at 1.week.from_now
    ends_at 1.week.from_now + 5.hours
    registration_starts_on 1.day.ago
    registration_ends_on 2.days.from_now
    location 'Odense'
    payment_needed false
    main_event false
  end
end
