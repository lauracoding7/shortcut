class Service < ApplicationRecord
  belongs_to :barber, class_name: "User"
  has_many :appointments
  validates :title, :duration, :price, presence: true
  validates :title, length: { maximum: 150 }
end
