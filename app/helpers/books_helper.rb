module BooksHelper

  def average_rating(book)
    book.reviews.average(:rating).to_f.round(1)
  end

  def review_count(book)
    book.reviews.count
  end

end