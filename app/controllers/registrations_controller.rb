class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_cofirmation, :first_name, :last_name)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_cofirmation, :first_name, :last_name)
  end
end
