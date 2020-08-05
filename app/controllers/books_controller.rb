class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @search = params[:search]
    if @search
        @books = Book.get_book_by_query(params[:search])#.page(params[:page])
    else
      @books = Book.all#.page(params[:page])
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Your book was successfully created."
      redirect_to @book
    else
      render :new
    end
  end

  def edit
  end

  def update
    if List.find_by_id(params[:book][:list_ids]).present?
      new_lists = List.find(params[:book][:list_ids])
      authorize_resources(new_lists)
      @book.lists << new_lists
      flash[:notice] = "Book was successfully added to your list(s)."
      redirect_to @book
    else
      @book.update(book_params)
      if @book.save
        flash[:success] = "Your book was successfully updated."
        redirect_to @book
      else
        render :edit
      end
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  
  def get_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :year_published, :page_count, :description)
  end

end