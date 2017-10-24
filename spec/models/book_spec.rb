require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "book attributes" do
    # it { should validate_presence_of(:title) }

    # it { should validate_uniqueness_of(:title) }
  end

  describe "book relationships" do
    # it { should have_many(:book_formats) }
    # it { should have_many(:formats) }
    # it { should have_many(:book_reviews) }

    # it { should belong_to(:publisher) }
    # it { should belong_to(:author) }
  end

  describe "book instance methods" do
    it "returns all available book format types" do
      format_types = ["Hardcover", "Softcover", "Kindle", "PDF"]
      book = Book.new(title: "A Game of Thornes")
      allow(book).to receive(:formats).and_return(format_types)

      expect(book.format_types).to eq(format_types)
    end

    it "returns the author's full name" do
      first_name = "George"
      last_name = "Martin"
      book = Book.new(title: "A Game of Thrones")
      allow(book.author).to receive(:first_name).and_return(first_name)
      allow(book.author).to receive(:last_name).and_return(last_name)

      expect(book.author_name).to eq("Martin, George")
    end

    it "returns the average rating for the book" do
      ratings = [5,5,4,3,3,5]
      book = Book.new(title: "A Game of Thrones")
      allow(book).to receive(:book_reviews).and_return(ratings)

      expect(book.average_rating).to eq(4.2)
    end
  end

  describe "book class methods" do
    xit "searches for books based on author name" do
      books = ["A Game of Thrones", "A Song of Ice and Fire"]

      # allow(Book).to receive()
    end
  end
end
