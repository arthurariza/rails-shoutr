module UserAvatarHelper
  def user_avatar_profile(user)
    image_tag user.avatar.variant(:profile) if user.avatar.attached?
  end

  def user_avatar_thumb(user)
    image_tag user.avatar.variant(:thumb) if user.avatar.attached?
  end
end
