class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :ensure_correct_user, {only: [:edit, :update]}

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update (item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  
  

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @item = Item.find_by(params[:id])
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end
end