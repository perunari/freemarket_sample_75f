class TopController < ApplicationController

  def index
    @item= Item.all.order("created_at DESC")
  end

end
