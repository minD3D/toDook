class FriendshipsController < ApplicationController
  after_action :reverse_create, only: :create
  after_action :reverse_destroy, only: :destroy
  def create
    rel = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
    rel.save

    redirect_to :back
  end

  def destroy
    rel = Friendship.where(user_id: current_user.id, friend_id: params[:friend_id])
    rel.delete_all

    redirect_to :back
  end

  private

  def reverse_create
    rel2 = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)
    rel2.save
  end
  def reverse_destroy
    rel = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id)
    rel.delete_all
  end






  def index
    @events = Event.all
  end

  def friend


    if params[:search]
      @keyword = params[:keyword]
      @search_users = User.where("email like ?", "%#{@keyword.to_s}%")

      @users = User.all
      @friends = User.find(current_user.id).friends
    else

      @users = User.all
      @friends = User.find(current_user.id).friends
    end

  end
end
