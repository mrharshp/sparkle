class PagesController < ApplicationController
  def home
    @items = Item.all
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
