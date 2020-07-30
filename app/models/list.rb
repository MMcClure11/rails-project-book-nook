class List < ApplicationRecord
  belongs_to :user

  has_many :book_lists
  has_many :books, through: :book_lists, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user,
  message: "of the list cannot be the same as any of your existing lists" }
  validates :description, presence: true
end
