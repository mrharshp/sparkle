class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

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
