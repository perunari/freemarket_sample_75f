class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def item_params
    # params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payment, :ship_from, :preparation, :price, images_attributes: [:picture]).merge(user_id: current_user.id)
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payment, :ship_from, :preparation, :price, images_attributes: [:picture])
  end

end
