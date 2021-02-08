require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.create(:user)
    
  end
  
  describe "商品出品機能" do
    context '出品ができる時' do
      it 'is valid with name, text, category_id, state_id, postage_id, region_id, shipping_date_id, price, image and user_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.image = fixture_file_upload('app/assets/images/star.png')
        expect(item).to be_valid
      end
    end

    context "出品ができない時" do
      it 'is invalid without name' do
        user = @user
        item = @item
        item.user_id = user.id
        item.name = ""
        item.valid?
        expect(item.errors.full_messages).to include "Name can't be blank"
      end
      it 'is invalid without text' do
        user = @user
        item = @item
        item.user_id = user.id
        item.text = ""
        item.valid?
        expect(item.errors.full_messages).to include("Text can't be blank")
      end
      it 'is invalid without category_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.category_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Category Select")
      end
      it 'is invalid without state_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.state_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("State Select")
      end
      it 'is invalid without postage_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.postage_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Postage Select")
      end
      it 'is invalid without region_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.region_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Region Region Select")
      end
      it 'is invalid without shipping_date_id' do
        user = @user
        item = @item
        item.user_id = user.id
        item.shipping_date_id = ""
        item.valid?
        expect(item.errors.full_messages).to include("Shipping date Select")
      end
      it 'is invalid without price' do
        user = @user
        item = @item
        item.user_id = user.id
        item.price = ""
        item.valid?
        expect(item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字以外の場合' do
        user = @user
        item = @item
        item.user_id = user.id
        item.price = "a"
        item.valid?
        expect(item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300未満の場合' do
        user = @user
        item = @item
        item.user_id = user.id
        item.price = 200
        item.valid?
        expect(item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが小数点の場合' do
        user = @user
        item = @item
        item.user_id = user.id
        item.price = 300.1
        item.valid?
        expect(item.errors.full_messages).to include("Price must be an integer")
      end
      it '画像がない場合' do
        user = @user
        item = @item
        item.user_id = user.id
        item.image = nil
        item.valid?
        binding.pry
        expect(item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
