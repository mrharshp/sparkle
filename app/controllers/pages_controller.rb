class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @items = Item.all.select { |item| item.purchase.nil? }
  end

  def profile
    @user = current_user
  end

  def posts
    @user = current_user
    @items = Item.where(user: @user)
  end

  def basket
    @purchases = current_user.purchases.where(purchased: false)
  end
end
