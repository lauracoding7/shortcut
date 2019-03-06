class Message < ApplicationRecord
  belongs_to :author
  belongs_to :receiver
  belongs_to :appointment
  validates :content, length: { maximum: 1500 }
  validates :content, presence: true
  validate :author_cannot_be_same_as_receiver
end

def author_cannot_be_same_as_receiver
  if author_id == receiver_id
    errors.add(:author_same_as_receiver, "Author and receiver cannot be the same")
  end
end
