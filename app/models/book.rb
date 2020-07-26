class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, presence: true
  validates :author, presence: true

  exclude_words = ["the", "and", "or", "to", "a", "but"]

  scope :sort_by_title, -> { order(title: :asc) }



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
