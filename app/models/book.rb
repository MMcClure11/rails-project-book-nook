class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true

  scope :sort_by_title, -> { order(title: :asc) }

  # def self.create_book_from_api(query)
  #   book = GoogleApi.search(query)
  #   @book = Book.find_or_create_by(title: book["title"], author: book["authors"].join(", "), year_published: book["publishedDate"].to_i, page_count: book["pageCount"], description: book["description"])
  # end

  #results["items"].map { |item| Book.find_or_create_by(title: item["volumeInfo"]["title"], author: item["volumeInfo"]["authors"]) }

  def self.find_or_create_book_by_api_hash(book)
    self.find_or_create_by(title: book["title"], author: book["authors"].join(", "), year_published: book["publishedDate"].to_i, page_count: book["pageCount"], description: book["description"])
  end

  def self.get_book_by_query(query)
    search = GoogleApi.search(query)
    search["items"].map { |item| Book.find_or_create_book_by_api_hash(item["volumeInfo"]) }
  end

  #  def self.get_book_by_query(query)
  #   search = GoogleApi.search(query)
  #   search.map { |item| Book.find_or_create_book_by_api_hash(item["volumeInfo"]) }
  # end

 # potential attributes ["title", "subtitle", "authors", "publisher", "publishedDate", "description", "industryIdentifiers", "readingModes", "pageCount", "printType", "categories", "averageRating", "ratingsCount", "maturityRating", "allowAnonLogging", "contentVersion", "panelizationSummary", "imageLinks", "language", "previewLink", "infoLink", "canonicalVolumeLink"]


end
