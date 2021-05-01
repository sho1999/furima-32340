require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入機能' do
    before do
      sleep 0.1
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      @user_purchase = FactoryBot.build(:user_purchase, user_id: @user.id, item_id: @item.id)
    end

    context 'When you can buy' do
      it "全ての情報があれば保存できる" do
        expect(@user_purchase).to be_valid
      end
      it "建物番号は空でも登録できること" do
        @user_purchase.building = ""
        expect(@user_purchase).to be_valid
      end
    end

    context 'When you cannot buy' do
      it "postcodeが空では保存ができないこと" do
        @user_purchase.postcode = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postcode can't be blank")
      end
      it "region_idが空では保存ができないこと" do
        @user_purchase.region_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Region can't be blank")
      end
      it "cityが空では保存ができないこと" do
        @user_purchase.city = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空では保存ができないこと" do
        @user_purchase.block = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numが空では保存ができないこと" do
        @user_purchase.phone_num = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone num can't be blank")
      end
      it "tokenが空では保存ができないこと" do
        @user_purchase.token = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "postcodeは3桁-4桁でないと保存できないこと" do
        @user_purchase.postcode = "1234567"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postcode はハイフンあり7桁で入力して下さい")
      end
      it "phone_numはハイフンなし11桁以内でないと保存できない" do
        @user_purchase.phone_num = "080-8978-1234"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone num はハイフンなし11桁以内で入力して下さい")
      end
      it "user_idが空では登録できないこと" do
        @user_purchase.user_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @user_purchase.item_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'is invalid without a resion_id' do
        @user_purchase.region_id = 0
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Region must be other than 0")
      end
    end
  end
end
