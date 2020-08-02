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

  

end
