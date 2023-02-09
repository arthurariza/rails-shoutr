class ApplicationController < ActionController::Base
  def current_user
    super || Guest.new
  end
end
