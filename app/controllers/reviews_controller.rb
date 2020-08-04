class ReviewsController < ApplicationController
  before_action :authenticate
  before_action :get_review, only: [:update]

  def index
    if params[:book_id].present? 
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    if params[:book_id]
      @book = Book.find(params[:book_id])
      @review = @book.reviews.find(params[:id])
    end
  end

  def new
    if params[:book_id] && !Book.exists?(params[:book_id])
      flash[:notice] = "Book not found."
      redirect_to books_path
    elsif already_written_review?(params[:book_id])
      flash[:notice] = "You already wrote a review for this book."
      redirect_to book_reviews_path(params[:book_id])
    else
      @review = Review.new(book_id: params[:book_id])
      @book = Book.find(params[:book_id])
    end
  end

  def create
    @book = Book.find(params[:review][:book_id])
    if already_written_review?(@book.id)
      flash[:notice] = "You already wrote a review for this book."
      redirect_to book_reviews_path(@book)
    else
      @review = current_user.reviews.new(review_params)
      if @review.save
        redirect_to book_reviews_path(@book)
      else
        @errors = @review.errors.full_messages
        render :new
      end
    end
  end

  def edit
    book = Book.find_by(id: params[:book_id])
    if book.nil?
      flash[:notice] = "Book not found."
      redirect_to books_path
    else
      @review = book.reviews.find_by(id: params[:id])
      if @review.nil?
        flash[:notice] = "Review not found." 
        redirect_to book_reviews_path(book)
      else 
        authorize(@review)
        @book = @review.book
      end
    end
  end

  def update
    @book = Book.find(params[:review][:book_id])
    if already_written_review?(@book.id)
      flash[:notice] = "You already wrote a review for this book."
      redirect_to book_reviews_path(@book)
    else
      authorize(@review) 
      @review.update(review_params)
      if @review.save
        redirect_to book_reviews_path(@book)
      else
        @errors = @review.errors.full_messages
        render :edit
      end
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    review = Review.find(params[:id])
    authorize(review)
    review.destroy
    redirect_to book_reviews_path(@book)
  end

  private

  def get_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:book_id, :rating, :content)
  end

end