class SubcategoriesController < ApplicationController
  add_breadcrumb "カテゴリー", :categories_path


  # 子供の一覧
  def show
    @child = Category.find(params[:id])
    @grandchildren = @child.children
    @parent = @child.parent

    
    add_breadcrumb @child.parent.name, "/categories/#{@parent.id}"
    add_breadcrumb @child.name
  end
end
