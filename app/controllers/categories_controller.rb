class CategoriesController < ApplicationController

  def index
    @category = Category.where(ancestry: nil)

  end

  def show
    # Category.
  end

end
