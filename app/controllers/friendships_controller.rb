# frozen-string-literal: true

class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    friendship = current_user.friendships.new(friend_id: friend.id)
    if friendship.save
      flash[:notice] = t("flash.friendship_created")
    else
      flash[:alert] = t("flash.friendship_create_error")
    end

    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = t("flash.friendship_deleted")
    redirect_to my_friends_path
  end
end
