class ItemsController < ApplicationController
  before_action :authenticate_user!, {only: [:new, :edit, :update, :destroy]}
  before_action :item_find, {only: [:show, :edit, :update,]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
    if @item.update (item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user.id == current_user.id
      item.destroy
      redirect_to items_path
    else
      render :show
    end
  end

  
  
  

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end
  
end