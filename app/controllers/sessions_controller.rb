# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_to_lists, unless: :logged_in?, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to lists_path
    else
      flash[:error] = 'Invalid login or password!'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out!"
    redirect_to login_path
  end
end
