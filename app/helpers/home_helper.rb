module HomeHelper
  def is_friend?(current_user_id, friend_id)
    a = Friendship.where(user_id: current_user_id, friend_id: friend_id)
    if a.blank?
      false
    else
      true
    end
  end
end
