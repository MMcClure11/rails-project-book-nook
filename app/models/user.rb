class User < ApplicationRecord
  has_secure_password
  
  has_many :reviews
  has_many :books, through: :reviews

  has_many :lists

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
