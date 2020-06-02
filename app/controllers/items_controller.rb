class ItemsController < ApplicationController
  before_action :set_parent_categories, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.build
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(1)
    @grandchild = @item.category
    @child = @item.category.parent
    @parent = @child.parent
  end

  def get_child_categories
    parent_category = Category.find(params[:id])
    @child_categories = parent_category.children
  end

  def get_grandchild_categories
    child_category = Category.find(params[:id])
    @grandchild_categories = child_category.children
  end

  private

  def item_params
    # params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition_id, :postage_payment_id, :ship_from_id, :preparation_id, :price, images_attributes: [:picture]).merge(user_id: current_user.id)
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition_id, :postage_payment_id, :ship_from_id, :preparation_id, :price, images_attributes: [:picture]).merge(user_id: 1)
  end

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end

end
