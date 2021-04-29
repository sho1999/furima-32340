class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :self_confirm
  before_action :sold_out


  def index
    @user_purchase = UserPurchase.new
  end

  def new
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    binding.pry
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:user_purchase).permit(:postcode, :region_id, :city, :block, :building, :phone_num).merge(token: params[:token],user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def self_confirm
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end

