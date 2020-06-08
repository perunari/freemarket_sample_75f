class CategoriesController < ApplicationController

  # 全体像
  def index
    @category = Category.where(ancestry: nil)
  end

  # 親の一覧
  def show
    @parent = Category.find(params[:id])
    @children = @parent.children
  end
end
