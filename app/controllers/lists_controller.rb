class ListsController < ApplicationController
  before_action :authenticate
  before_action :get_list, only: [:show]

  def index
    @lists = current_user.lists.all
  end

  def show
  end

  def new
    @list = List.new
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

end
