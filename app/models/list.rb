class List < ApplicationRecord
  belongs_to :user

  has_many :book_lists
  has_many :books, through: :book_lists, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
