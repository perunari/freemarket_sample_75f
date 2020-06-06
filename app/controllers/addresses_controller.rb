class AddressesController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @address = current_user.address
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
      if current_user == @user
      
      else
        redirect_to root_url
      end   
    end
end
