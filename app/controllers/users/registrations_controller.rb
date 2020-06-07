class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end 

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  def edit
    user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  protected
  
  def address_params
    params.require(:address).permit(:family_name, :first_name,:family_name_kana, :first_name_kana, :postal_code, :prefecture_id, :city, :block, :building, :phone)
  end

  def user_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end

end
