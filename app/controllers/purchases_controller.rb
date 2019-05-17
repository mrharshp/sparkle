class PurchasesController < ApplicationController
  before_action :find_item, only: [:show, :new, :create, :destroy]

  def index
    @user = current_user
    @purchases = Purchase.where(user: @user)
  end

  def show
    @user = current_user
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(user: current_user)
    @purchase.item = @item
    if @purchase.save
      redirect_to my_purchases_path
    else
      render :new
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to my_purchases_path
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end
end
