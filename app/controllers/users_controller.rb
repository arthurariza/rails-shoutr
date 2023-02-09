class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @shouts = @user.shouts
  end
end
