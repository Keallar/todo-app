# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    redirect_to lists_path unless logged_in?

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Successfully registration!!!"
      redirect_to login_path
    else
      flash[:error] = 'Some info is invalid'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
