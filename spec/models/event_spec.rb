require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to_not validate_presence_of :ends_at }
  it { is_expected.to_not validate_presence_of :registration_starts_on }
  it { is_expected.to_not validate_presence_of :registration_ends_on }

  context 'is invalid when' do
    specify 'start time is not specified' do
      expect(build(:event, starts_at: nil)).to_not be_valid
    end

    specify 'start time is not a timestamp' do
      expect(build(:event, starts_at: 'not a timestamp')).to_not be_valid
    end

    specify 'end time is not a timestamp' do
      expect(build(:event, ends_at: 'not a timestamp')).to_not be_valid
    end

    specify 'registration start is not a date' do
     expect(build(:event, registration_starts_on: 'not a date')).to_not be_valid
    end

    specify 'registration end is not a date' do
      expect(build(:event, registration_ends_on: 'not a date')).to_not be_valid
    end

    specify 'it ends before it starts' do
      event = build(:event, starts_at: 3.days.from_now,
                    ends_at: 2.days.from_now)
      event.valid?
      expect(event.errors[:ends_at]).to include('must be after start time')
    end

    specify 'registration ends before it starts' do
      event = build(:event, registration_starts_on: 3.days.from_now,
                    registration_ends_on: 2.days.from_now)
      event.valid?
      expect(event.errors[:registration_ends_on]).to include('must be after registration start date')
    end
  end
end
