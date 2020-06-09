class UsersController < ApplicationController

  def index
    @address = current_user.address
  end

  def show
    @user = current_user
    @items = @user.items
    @address = current_user.address
  end

  def edit
  end

end
