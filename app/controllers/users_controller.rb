class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_profile_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :email)
  end
end
