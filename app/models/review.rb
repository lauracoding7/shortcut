class Review < ApplicationRecord
  belongs_to :author
  belongs_to :receiver
  validates :content, length: { minimum: 20, maximum: 1500 }
  validates :rating, numericality: { less_than: 6, greater_than_or_equal_to: 0 }
  validate :author_cannot_be_same_as_receiver
end

def author_cannot_be_same_as_receiver
  if author_id == receiver_id
    errors.add(:author_same_as_receiver, "Author and receiver cannot be the same")
  end
end
