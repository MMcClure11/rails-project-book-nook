class ReviewsController < ApplicationController

  def index
    if params[:book_id].present? 
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    else
      @reviews = Review.all
    end
  end

end