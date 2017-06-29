class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @events = @user.events
  end

  def destroy
    @events = Event.find(params[:id])

    @events.destroy

    redirect_to '/'
  end

  def edit
    @events = Event.find(params[:id])
  end

  def update
    @events = Event.find(params[:id])
    @events.content = params[:content]
    @events.start_time = params[:start_time]
    @events.end_time = params[:end_time]
    @events.place = params[:place]

    @events.save

    redirect_to '/'
  end

  def friend

    if params[:all]
      @friends = User.find(current_user.id).friends
      @a = Event.none
      @friends.each do |f|
        b = Event.where(user_id: f.id)
        @a = @a.or(b)
      end
      @a = @a.order(created_at: :desc)
    else
      if params[:search]
        @keyword = params[:keyword]
        @search_users = User.where("email like ?", "%#{@keyword.to_s}%")
        if params[:id].present?
          @events = User.find(params[:id]).events
        end
        @friends = User.find(current_user.id).friends
      else
        if params[:id].present?
          @events = User.find(params[:id]).events
        end
        @friends = User.find(current_user.id).friends
      end
    end




  end

end
