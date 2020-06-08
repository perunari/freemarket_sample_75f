class UsersController < ApplicationController

  def index
  end

  def show
    @user = current_user
    @items = @user.items
  end

  def edit
  end

end
