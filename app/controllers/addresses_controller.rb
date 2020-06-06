class AddressesController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @address = current_user.address
  end
end
