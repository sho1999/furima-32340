class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
  

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end