class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
    @tax = 1.1
  end

end
