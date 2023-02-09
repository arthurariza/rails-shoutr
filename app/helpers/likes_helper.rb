module LikesHelper
  def like_button(user, shout)
    if user.liked?(shout)
      button_to 'Dislike', likes_path(shout), method: :delete
    else
      button_to 'Like', likes_path(shout), method: :post
    end
  end
end
