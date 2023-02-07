class UsersController < ApplicationController
  def show
    @shouts = User.find(params[:id]).shouts
  end
end
