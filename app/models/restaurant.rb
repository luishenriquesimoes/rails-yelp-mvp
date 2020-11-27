class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validate :category_included

  def category_included
    valid_categories = %w[chinese belgian italian japanese french]
    errors.add(:category, 'Invalid categories') unless valid_categories.include?(category)
  end
end
