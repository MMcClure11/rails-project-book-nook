class List < ApplicationRecord
  belongs_to :user

  has_many :book_lists
  has_many :books, through: :book_lists, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user, message: "of the list cannot be the same as any of your existing lists" }
  validates :description, presence: true

  # def self.find_book_in_list(book)
  #   book.lists.each do |list|
  #     if book.lists.include?(list)
  #       #flash[:notice] = "Book is already in #{list.name}"
  #     else
  #       book.lists << list
  #     end
  #   end
  # end

end
