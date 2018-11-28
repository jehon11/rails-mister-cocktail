class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, :from, presence: true
end
