class SubcategoriesController < ApplicationController
  # 子供の一覧
  def show
    @child = Category.find(params[:id])
    @grandchildren = @child.children
  end
end
