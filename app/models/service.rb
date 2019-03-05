class Service < ApplicationRecord
  belongs_to :barber
  has_many :appointments
end
