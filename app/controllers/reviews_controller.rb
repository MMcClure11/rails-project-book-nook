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
    @book = Book.find(params[:review][:book_id])
    @review = Review.new(review_params)
    @review.save
    redirect_to book_reviews_path(@book)
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @book = Book.find(params[:review][:book_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.save
    redirect_to book_reviews_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :book_id, :rating, :content)
  end

end