class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.user == current_user
      @item.update(item_params)
      redirect_to item_path(@item)
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to items_path
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo)
  end
end
