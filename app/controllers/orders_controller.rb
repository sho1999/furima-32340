class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.permit(:postcode, :region_id, :city, :block, :building, :phone_num)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

