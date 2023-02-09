class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shout

  def create
    current_user.like(@shout)

    redirect_to shouts_path
  end

  def destroy
    current_user.dislike(@shout)

    redirect_to shouts_path
  end

  private

  def set_shout
    @shout = Shout.find(params[:id])
  end
end
