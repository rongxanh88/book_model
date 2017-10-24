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

  def self.search(query, options)
    books = self.search_author(query) +
            self.search_publisher(query) +
            self.search_title(query)

    if (options[:title])
      books = self.search_title(query)
    elsif (options[:book_format_type_id] != nil)
      books = books.select { |book| book.book_format_id == options[:book_format_type_id]}
    elsif (options[:book_format_physical])
      
    end
    books.uniq
  end

  def self.search_author(query)
    joins(:author).where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?", "%#{query}%", "%#{query}%")
  end

  def self.search_publisher(query)
    joins(:publisher).where("LOWER(name) LIKE ?", "%#{query}%")
  end

  def self.search_title(query)
    where("LOWER(title) LIKE ?", "%#{query}%")
  end
end
