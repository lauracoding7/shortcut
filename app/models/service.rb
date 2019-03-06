class Service < ApplicationRecord
  belongs_to :barber
  has_many :appointments
  validates :content, :title, :duration, :price, presence: true
  validates :title, length: { maximum: 150 }
end
