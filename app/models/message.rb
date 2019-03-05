class Message < ApplicationRecord
  belongs_to :author
  belongs_to :receiver
  belongs_to :appointment
end
