class Book < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :book_reviews
  has_many :book_formats
  has_many :formats, through: :book_formats

  belongs_to :publisher
  belongs_to :author
end
