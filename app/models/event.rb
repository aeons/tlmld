class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :starts_at
  validates :starts_at, date: true
  validates :ends_at, date: {after: :starts_at,
                             message: 'must be after start time',
                             allow_blank: true}
  validates :registration_starts_on, date: {allow_blank: true}
  validates :registration_ends_on, date: {after: :registration_starts_on,
                                          message: 'must be after registration start date',
                                          allow_blank: true}

  has_many :registrations, dependent: :destroy
end
