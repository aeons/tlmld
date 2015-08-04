require 'rails_helper'

RSpec.describe Registration, type: :model do
  it 'has a valid factory' do
    expect(build(:registration)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :event }
  it { is_expected.to_not validate_presence_of :deregistered_at}
  it { is_expected.to belong_to :event}

  context 'is invalid when' do
    specify 'registration time is not specified' do
      expect(build(:registration, registered_at: nil)).to_not be_valid
    end

    specify 'registration time is not a timestamp' do
      expect(build(:registration, registered_at: 'not a timestamp')).to_not be_valid
    end

    specify 'deregistration time is not a timestamp' do
      expect(build(:registration, registered_at: 'not a timestamp')).to_not be_valid
    end

    specify 'email is not an email address' do
      reg = build(:registration, email: 'not an email')
      reg.valid?
      expect(reg.errors[:email]).to include('is invalid')
    end
  end
end
