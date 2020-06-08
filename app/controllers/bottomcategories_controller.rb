class BottomcategoriesController < ApplicationController
  add_breadcrumb "カテゴリー", :categories_path


  # 孫の一覧
  def show
    @grandchild = Category.find(params[:id])
    @child = @grandchild.parent
    @parent = @child.parent

    add_breadcrumb @grandchild.parent.parent.name, "/categories/#{@parent.id}"
    add_breadcrumb @grandchild.parent.name, "/subcategories/#{@child.id}"
    add_breadcrumb @grandchild.name
  end
end
