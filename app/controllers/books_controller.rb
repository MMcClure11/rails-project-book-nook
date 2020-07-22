class BooksController < ApplicationController
  before_action :get_book, only: [:show]

  def index
    @books = Book.all
  end

  def show
  end

  private
  
  def get_book
    @book = Book.find(params[:id])
  end

end