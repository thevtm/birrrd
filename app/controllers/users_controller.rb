class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def my_profile
    @user = current_user
    render "show"
  end
end
