class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  has_many :book_lists
  has_many :lists, through: :book_lists #, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true


  scope :sort_by_title, -> { order(title: :asc) }

end
