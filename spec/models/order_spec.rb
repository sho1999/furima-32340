require 'rails_helper'

RSpec.describe Order, type: :model do

  # フォームオブジェクトがあるので不要です

  
  # before do
  #   @user = FactoryBot.build(:user)
  #   @item = FactoryBot.build(:item, user_id: @user.id)
  #   @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id )
  # end

  # describe '購入機能' do
  #   context 'When you can buy' do
  #     it "全ての情報があれば保存できる" do
  #       expect(@order).to be_valid
  #     end
  #     it "建物番号は空でも登録できること" do
  #       @order.building = ""
  #       expect(@order).to be_valid
  #     end
  #   end

  #   context 'When you cannot buy' do
  #     it "postcodeが空では保存ができないこと" do
  #       @order.postcode = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Postcode can't be blank")
  #     end
  #     it "region_idが空では保存ができないこと" do
  #       @order.region_id = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Region can't be blank")
  #     end
  #     it "cityが空では保存ができないこと" do
  #       @order.city = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("City can't be blank")
  #     end
  #     it "blockが空では保存ができないこと" do
  #       @order.block = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Block can't be blank")
  #     end
  #     it "phone_numが空では保存ができないこと" do
  #       @order.phone_num = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Phone num can't be blank")
  #     end
  #     it "tokenが空では保存ができないこと" do
  #       @order.token = ""
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Token can't be blank")
  #     end
  #     it "postcodeは3桁-4桁でないと保存できないこと" do
  #       @order.postcode = "1234567"
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Postcode はハイフンあり7桁で入力して下さい")
  #     end
  #     it "phone_numはハイフンなし11桁以内でないと保存できない" do
  #       @order.phone_num = "080-8978-1234"
  #       @order.valid?
  #       expect(@order.errors.full_messages).to include("Phone num はハイフンなし11桁以内で入力して下さい")
  #     end
  #     it "user_idが空では登録できないこと" do
        
  #     end
  #     it "item_idが空では登録できないこと" do
  #     end
  #   end
  # end
end