class CategoriesController < ApplicationController
  add_breadcrumb "カテゴリー", :categories_path


  # 全体像
  def index
    @category = Category.where(ancestry: nil)
  end

  # 親の一覧
  def show
    @parent = Category.find(params[:id])
    @children = @parent.children

    add_breadcrumb @parent.name
  end
end
