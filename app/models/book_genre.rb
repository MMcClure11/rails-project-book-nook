class BookGenre < ApplicationRecord
  belongs_to :book_id
  belongs_to :genre_id
end
