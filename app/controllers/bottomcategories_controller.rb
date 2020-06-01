class BottomcategoriesController < ApplicationController
  # 孫の一覧
  def show
    @grandchild = Category.find(params[:id])
  end
end
