class Registration < ActiveRecord::Base
  validates_presence_of :name, :event
  validates :email, presence: true, format: /@/
  validates :registered_at, date: true
  validates :deregistered_at, date: { allow_blank: true }

  belongs_to :event
end
