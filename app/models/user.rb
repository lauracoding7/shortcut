class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch
  multisearchable against: [:name]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :services, foreign_key: 'barber_id'
  has_many :appointments
  has_many :messages
  has_many :reviews

  geocoded_by :host_service_address, latitude: :host_service_latitude, longitude: :host_service_longitude
  geocoded_by :commute_area_address, latitude: :commute_area_latitude, longitude: :commute_area_longitude

  after_validation :geocode_endpoints

  def is_client?
    self.services.first.nil?
  end

  private

  def geocode_endpoints
    if host_service_address_changed?
      geocoded = Geocoder.search(host_service_address).first
      if geocoded
        self.host_service_latitude = geocoded.latitude
        self.host_service_longitude = geocoded.longitude
      end
    end
    if commute_area_address_changed?
      geocoded = Geocoder.search(commute_area_address).first
      if geocoded
        self.commute_area_latitude = geocoded.latitude
        self.commute_area_longitude = geocoded.longitude
      end
    end
  end
end
