class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  has_many :book_lists
  has_many :lists, through: :book_lists #, dependent: :destroy
  has_many :users, through: :book_lists

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true


  scope :sort_by_title, -> { order(title: :asc) }

  def can_edit_and_delete?
    self.reviews.empty? && self.lists.empty?
  end

  def self.find_or_create_book_by_api_hash(book)
    self.find_or_create_by(title: book["title"], author: book["authors"].join(", "), year_published: book["publishedDate"].to_i, page_count: book["pageCount"], description: book["description"])
  end

  def self.get_book_by_query(query)
    search = GoogleApi.search(query)
    if search["totalItems"] == 0
      rescue404 #what the fuck do i put here?
    else
      search["items"].map { |item| Book.find_or_create_book_by_api_hash(item["volumeInfo"]) }
    end
  end

  

end
