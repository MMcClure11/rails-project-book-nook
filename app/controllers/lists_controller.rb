class ListsController < ApplicationController
  before_action :authenticate
  before_action :get_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists.all
  end

  def show
    authorize(@list)
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list
    else
      @errors = @list.errors.full_messages
      render 'new'
    end
  end

  def edit
    authorize(@list)
  end

  def update
    authorize(@list)
    @list.update(list_params)
    if @list.save
      redirect_to @list
    else
      @errors = @list.errors.full_messages
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description, :book_ids => [])
  end

end
