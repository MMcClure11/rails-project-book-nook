class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  
  def get_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
  end

end