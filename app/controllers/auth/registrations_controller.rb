class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  wrap_parameters User, include: [:name, :email, :password, :password_confirmation]

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email)
  end
end
