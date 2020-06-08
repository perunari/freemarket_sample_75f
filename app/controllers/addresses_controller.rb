class AddressesController < ApplicationController
  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to root_path
  end

  protected
  
  def address_params
    params.require(:address).permit(:family_name, :first_name,:family_name_kana, :first_name_kana, :postal_code, :prefecture_id, :city, :block, :building, :phone)
  end
  
end
