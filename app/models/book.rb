class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :author, presence: true

  def self.sort_by_title 
    all.order(title: :asc)
  end
end
