class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  validates :name, presence: true, uniqueness: true

  scope :order_by_name, -> { order(name: :asc) }
end
