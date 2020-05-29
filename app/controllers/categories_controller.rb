class CategoriesController < ApplicationController

  def index
    @category = Category.where(ancestry: nil)
    
  end

end
