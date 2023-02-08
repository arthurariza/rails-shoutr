class ShoutsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @shout = Shout.new
    @shouts = Shout.order(created_at: :desc)
  end

  def create
    @shout = current_user.shouts.new(shout_params)

    if @shout.save
      redirect_to root_url, notice: 'Shout Created!'
    else
      @shouts = Shout.order(created_at: :desc)

      render :index, status: :unprocessable_entity
    end
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
