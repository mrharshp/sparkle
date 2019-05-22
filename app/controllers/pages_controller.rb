class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @items = Item.all.select { |item| item.purchase.nil? }
    @anklets = @items.select {|item| item.category == "Anklets"}
    @earrings = @items.select {|item| item.category == "Earrings"}
    @necklaces = @items.select {|item| item.category == "Necklaces"}
    @rings = @items.select {|item| item.category == "Rings"}
    @watches = @items.select {|item| item.category == "Watches"}
    @others = @items.select {|item| item.category == "Other"}
  end

  def profile
    @user = current_user
  end

  def posts
    @user = current_user
    @items = Item.where(user: @user)
    @purchases = Purchase.where(user: @user)
  end

  def basket
    @purchases = current_user.purchases.where(purchased: false)
  end
end
