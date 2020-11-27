class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, presence: true
  validates :content, presence: true
  validate :valid_rating

  def valid_rating
    return if rating.is_a?(Integer) && rating >= 0 && rating <= 5

    errors.add(:rating, 'Ratings must be numbers from 0 to 5')
  end
end
