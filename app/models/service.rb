class Service < ApplicationRecord
  belongs_to :barber, class_name: "User"
  has_many :appointments
end
