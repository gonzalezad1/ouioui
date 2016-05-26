class RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :fullname, :phone_number, :description, :interest, :email, :password, :password_confirmation, :image => [])
  end
end


