class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, inclusion: { in: 1..10, message: "must be a number 1-10"}
  validates :content, presence: true

  scope :recent, ->(num) { order('created_at DESC').limit(num) }
end
