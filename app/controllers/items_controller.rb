class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Items.new
  end

  def create
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :state_id, :delivery_fee_id, :region_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
