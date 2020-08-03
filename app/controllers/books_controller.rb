class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @search = params[:search]
    if @search
        @books = Book.get_book_by_query(params[:search])
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
      @errors = @book.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if List.find_by_id(params[:book][:list_ids]).present?
      new_lists = List.find(params[:book][:list_ids])
        if !@book.lists.include?(new_lists)
          @book.lists << new_lists
          flash[:notice] = "Book was successfully added to your list."
          redirect_to @book
        end
    else
      @book.update(book_params)
      if @book.save
        flash[:success] = "Your book was successfully updated."
        redirect_to @book
      else
        @errors = @book.errors.full_messages
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