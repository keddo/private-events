class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @prev_events = @user.attended_events.prev_events
    @comming_events = @user.attended_events.comming_events
  end
end
