class ListsController < ApplicationController

  def index
    @lists = current_user.lists.all
  end

end
