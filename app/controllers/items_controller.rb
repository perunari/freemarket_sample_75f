class ItemsController < ApplicationController
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]
  before_action :signed_in?, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    @item.price = 0
  end

  def create
    params[:item][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @item.images.build
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:item][:category_id] if params[:item][:category_id].present?
      render :new
    end
  end

  def edit
    @child_category = @item.category.parent
    @parent_category = @child_category.parent
  end

  def update
    params[:item][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?
    if @item.update(item_params)
      redirect_to root_path
    else
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:item][:category_id] if params[:item][:category_id].present?
      render :edit
    end
  end

  def show
    @grandchild = @item.category
    @child = @item.category.parent
    @parent = @child.parent
    @preparation = @item.preparation.name
    @condition = @item.condition.name
    @address = @item.user.address.prefecture.name
    @size = @item.size
    @brand = @item.brand.name
    @picture = @item.images
    @tax = 1.1
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品が削除されました'
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      render :show
    end
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
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition_id, :postage_payment_id, :ship_from_id, :preparation_id, :price, images_attributes: [:picture, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end

  def signed_in?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
