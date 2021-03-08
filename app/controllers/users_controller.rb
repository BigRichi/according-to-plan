class UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :handle_login, :new, :create]

  def login
  end

  def handle_login

    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to event_path(@user.events)
    else
      redirect_to login_path
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to event_path(@user.events)
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
