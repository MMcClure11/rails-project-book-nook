class User < ApplicationRecord
  has_secure_password
  
  has_many :reviews
  has_many :books, through: :reviews

  has_many :lists
  has_many :book_lists, through: :lists
  has_many :books, through: :book_lists

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true

  scope :most_reviews, -> {joins(:reviews).group("users.id").order("count(reviews.id) DESC").limit(5)}
end
