class ReviewsController < ApplicationController

  def index
    if params[:book_id].present? 
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    else
      @reviews = Review.all
    end
  end

  def new
    if params[:book_id] && !Book.exists?(params[:book_id])
      redirect_to books_path
    else
      @review = Review.new(book_id: params[:book_id], user_id: 1)
      @book = Book.find(params[:book_id])
    end
  end

  def create
  end

end