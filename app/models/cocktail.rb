class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true

  def average_rating
    sum = 0

    reviews.each do |review|
      sum += review.rating unless review.rating.nil?
    end
    if sum.fdiv(reviews.length).nan?
      ''
    else
      sum.fdiv(reviews.length).fdiv(0.5).ceil * 0.5
    end
  end

  def stars
    average_rating == '' ? 0 : average_rating.floor
  end

  def half_star
    average_rating == '' ? '' : !(average_rating % 1 == 0)
  end
end
