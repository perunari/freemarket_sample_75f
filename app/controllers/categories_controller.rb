class CategoriesController < ApplicationController

  def index
    @category = Category.where(ancestry: nil)
  end

  def show
    @parent = Category.find(params[:id])
    @children = @parent.children
    @grandchildren = @children.children
  end

end
