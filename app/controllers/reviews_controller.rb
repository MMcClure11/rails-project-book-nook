class ReviewsController < ApplicationController
  before_action :authenticate

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
    else
      @review = Review.new(book_id: params[:book_id])
      @book = Book.find(params[:book_id])
    end
  end

  def create
    @book = Book.find(params[:review][:book_id])
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to book_reviews_path(@book)
    else
      @errors = @review.errors.full_messages
      render :new
    end
  end

  def edit
    if params[:book_id]
      book = Book.find_by(id: params[:book_id])
      if book.nil?
        flash[:notice] = "Book not found."
        redirect_to books_path
      else
        @review = book.reviews.find_by(id: params[:id])
        #authorize(@review)
        # @book = @review.book
        if @review.nil?
          flash[:notice] = "Review not found." 
          redirect_to book_reviews_path(book)
        elsif @review.user_id == current_user.id
          @book = @review.book
        else
          flash[:notice] = "You may not edit another user's review."
          redirect_to "/books/#{params[:book_id]}/reviews/#{params[:id]}"
        end
      end
    # else
    #   @review = Review.find(params[:id])
    end
  end

  def update
    #  if params[:review][:book_id]
    #   @book = Book.find_by(id: params[:review][:book_id])
    #   if @book.nil?
    #     flash[:notice] = "Book not found."
    #     redirect_to books_path
    #   else
    #     if params[:id]
    #       @review = @book.reviews.find_by(id: params[:id])
    #       if @review.nil?
    #         flash[:notice] = "Review not found." 
    #         redirect_to book_reviews_path(@book)
    #       end
    #     end
    #   end
    #  else
    #   @book = Book.find(params[:review][:book_id])
    #   @review = Review.find(params[:id])
    #   @review.update(review_params)
    #   if @review.save
    #     redirect_to book_reviews_path(@book)
    #   else
    #     @errors = @review.errors.full_messages
    #     render :edit
    #   end
    #  end
    
    book = Book.find(params[:review][:book_id])
    @review = Review.find(params[:id])
    # authorize(@review) #
    if @review.user_id == current_user.id
      @review.update(review_params)
      if @review.save
        redirect_to book_reviews_path(book)
      else
        @errors = @review.errors.full_messages
        render :edit
      end
    else
      flash[:notice] = "You may not edit another user's review."
      redirect_to book_reviews_path(book)
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    review = Review.find(params[:id])
    if current_user.id == review.user_id
      review.destroy
    else
      flash[:notice] = "You may not delete another user's review."
    end
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