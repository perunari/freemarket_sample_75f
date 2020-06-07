class TopController < ApplicationController

  def index
    @item= Item.where(status_id: 1).order("created_at DESC")
  end

end
