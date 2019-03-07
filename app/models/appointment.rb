class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :barber, class_name: "User"
  belongs_to :client, class_name: "User"
  has_many :messages
end
