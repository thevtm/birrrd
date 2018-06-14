class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @birds = Bird.where(user_id: current_user.id)
  end
end
