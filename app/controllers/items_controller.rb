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
    @item = Item.find(1)
    @grandchild = @item.category
    @child = @item.category.parent
    @parent = @child.parent
  end
end
