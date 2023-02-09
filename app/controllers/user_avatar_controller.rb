class UserAvatarController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def create
    current_user.update(avatar_params)

    redirect_to edit_user_registration_path
  end

  private

  def avatar_params
    params.require(:user).permit(:avatar)
  end
end
