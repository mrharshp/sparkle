class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
  end

  def purchases
    @user = current_user
  end

  def posts
    @user = current_user
  end
end
