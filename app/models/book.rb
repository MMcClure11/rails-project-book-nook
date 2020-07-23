class Book < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true

  def self.sort_by_title 
    all.order(title: :asc)
  end
end
