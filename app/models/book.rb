class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true

  scope :sort_by_title, -> { order(title: :asc) }

  def self.create_book_from_api(search)
    book = GoogleApi.search(search)
    @book = Book.find_or_create_by(title: book["title"], author: book["authors"].join(", "), year_published: book["publishedDate"].to_i, page_count: book["pageCount"], description: book["description"])
  end

  # def self.get_books_by_title(title)
  #   search = GoogleApi.search().results
  #   search["businesses"].map{|business| Restaurant.create_business_by_yelp_hash(business)}
  # end

 # potential attributes ["title", "subtitle", "authors", "publisher", "publishedDate", "description", "industryIdentifiers", "readingModes", "pageCount", "printType", "categories", "averageRating", "ratingsCount", "maturityRating", "allowAnonLogging", "contentVersion", "panelizationSummary", "imageLinks", "language", "previewLink", "infoLink", "canonicalVolumeLink"]


  # def self.sort_by_title 
  #   self.order(title: :asc)
  # end

  # def self.sort_by_title 
  #   self.remove_the.sort { |a, b| a <=> b }
  # end
###problem with this is that no longer have access to my activerecord objects 😢

  # def self.remove_the
  #   self.all.map do |book|
  #     book.title.gsub("The ", "")
  #   end
  # end

end
