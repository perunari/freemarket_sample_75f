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

  # 子供の一覧
  def child_show
    @children = Category.find(params[:id])
    @grandchildren = @children.children
  end

    # 孫の一覧
  def g_child_show
    @grandchildren = Category.find(params[:id])
  end
end
