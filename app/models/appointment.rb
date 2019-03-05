class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :barber
  belongs_to :client
  has_many :messages
end
