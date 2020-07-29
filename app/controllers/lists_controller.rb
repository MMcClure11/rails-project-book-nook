class ListsController < ApplicationController
  before_action :authenticate
  before_action :get_list, only: [:show, :edit, :update, :delete]

  def index
    @lists = current_user.lists.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description, book_ids: [])
  end

end
