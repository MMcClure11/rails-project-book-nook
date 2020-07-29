class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :author, presence: true


  scope :sort_by_title, -> { order(title: :asc) }

end
