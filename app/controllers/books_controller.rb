class BooksController < ApplicationController
  before_action :get_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    if @search = params[:search]
        @books = Book.get_book_by_query(params[:search])#.page(params[:page])
    elsif @search = params[:query]
      @books = Book.where("title LIKE ?", "%#{params[:query]}%")
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
    @book = Book.find_by_id(params[:id])
    if @book.can_edit_and_delete?
      render :edit
    else
      flash[:notice] = "The book #{@book.title} cannot be edited."
      redirect_to @book
    end
  end

  def update
    if List.find_by_id(params[:book][:list_id]).present?
      add_book_to_list(params[:book][:list_id], @book)
      flash[:success] = "Book was successfully added to your list."
      redirect_to @book
    else
      if @book.can_edit_and_delete?
        @book.update(book_params)
        if @book.save
          flash[:success] = "The book was successfully updated."
          redirect_to @book
        else
          render :edit
        end
      else
        flash[:notice] = "The book #{@book.title} cannot be edited."
        redirect_to @book
      end
    end
  end

  def destroy
    if @book.can_edit_and_delete?
      @book.destroy
      flash[:success] = "The book: #{@book.title}, was successfully deleted."
      redirect_to books_path
    else
      flash[:notice] = "The book #{@book.title} cannot be deleted."
      redirect_to @book
    end
  end

  def highest_ranked
    @books = Book.highest_ranked
  end

  private
  
  def get_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :year_published, :page_count, :description)
  end

end