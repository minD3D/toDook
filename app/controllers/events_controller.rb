class EventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(current_user.id)
    @event = @user.events.new(content: params[:content], start_time: params[:start_time], end_time: params[:end_time], place: params[:place])

    @event.save

    redirect_to '/'
  end

  def destroy

  end
end
