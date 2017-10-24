class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :book_reviews
  has_many :book_formats
  has_many :formats, through: :book_formats

  belongs_to :publisher
  belongs_to :author

  def author_name
    first_name = self.author.first_name
    last_name = self.author.last_name

    "#{last_name}, #{first_name}"
  end

  def format_types
    self.formats
  end

  def average_rating
    total = self.book_reviews.inject(0) { |sum, review| sum + review }
    (total.to_f / self.book_reviews.count).round(1)
  end
end
