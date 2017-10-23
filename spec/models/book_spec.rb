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

  end

  describe "book class methods" do

  end
end
