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
    { content: content_from_params }
  end

  def content_from_params
    case params[:shout][:content][:content_type]
    when 'TextShout'
      TextShout.new(text_content_params)
    when 'PhotoShout'
      PhotoShout.new(photo_content_params)
    end
  end

  def text_content_params
    params.require(:shout).require(:content).permit(:body)
  end

  def photo_content_params
    params.require(:shout).require(:content).permit(:photo)
  end
end
