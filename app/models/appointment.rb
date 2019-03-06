class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :barber, class_name: "User"
  belongs_to :client, class_name: "User"
  has_many :messages
  validates :location_address, :location_longitude, :location_latitude, presence: true
  validate :barber_cannot_be_same_as_client
end

def barber_cannot_be_same_as_client
  if barber_id == client_id
    errors.add(:barber_same_as_client, "Barber and client cannot be the same")
  end
end
