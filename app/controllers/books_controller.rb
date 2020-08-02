class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

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
    @book.update(book_params)
    
    if @book.save
      
      @book.lists.each do |list|
        if @book.lists.include?(list)
          flash[:notice] = "Book is already in #{list.name}"
        else
          @book.lists << list
        end
      end
      # if new_lists = List.find(params[:book][:list_ids])
      #     if !@book.lists.include?(new_lists)
      #       @book.lists << new_lists
      #     else
      #       flash[:notice] = "This book is already in that list"
      #       redirect_to @book
      #     end
      # end
      flash[:success] = "Your book was successfully updated."
      redirect_to @book
    else
      @errors = @book.errors.full_messages
      render :edit
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