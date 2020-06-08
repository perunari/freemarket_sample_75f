class BuyingsController < ApplicationController

  def new
    @address = current_user.address
    @item = Item.find(params[:item_id])
    @images = @item.images
  end

  def create
  end

end
