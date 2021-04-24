class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :self_confirm, only: [:edit, :update]
  before_action :authenticate_user!, except: [:show, :index]

  
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :state_id, :delivery_fee_id, :region_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def self_confirm
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end