class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :barber, class_name: "User"
  belongs_to :client, class_name: "User"
  has_many :messages
  validates :datetime, :location_address, presence: true
  validates :state, inclusion: { in: %w(pending approved rejected paid), message: "%{value} is not a valid state" }
  validate :barber_cannot_be_same_as_client

  geocoded_by :location_address, latitude: :location_latitude, longitude: :location_longitude
  after_validation :geocode, if: :will_save_change_to_location_address?

  def service_price
    service.price
  end

  def commute_price
    barber.commute_price
  end
end

private

def barber_cannot_be_same_as_client
  if barber_id == client_id
    errors.add(:barber_same_as_client, "Barber and client cannot be the same")
  end
end
