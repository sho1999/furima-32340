require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "Nickname、Email、password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdateが存在すれば保存できる" do
        expect(@user).to be_valid
      end
      it "password、password_confirmationが英数字混合で7文字以上であれば保存できる" do
        @user.password = "ssss111"
        @user.password_confirmation = "ssss111"
        expect(@user).to be_valid
      end
      it "password、password_confirmationが同じなら保存できる" do
        @user.password = "ssss111"
        @user.password_confirmation = "ssss111"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it "Nicknameが空では保存できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "Emailが空では保存できない"    do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailでは保存できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "Emailに＠を含むこと" do
        @user.email = "tammie_carterhotmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "Passwordが空では保存できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "半角英字のみでは登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it "半角数字のみでは登録できない" do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it "全角では登録できない" do
        @user.password = "１１１１１１１"
        @user.password_confirmation = "１１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it "Passwordは6文字以下は保存できない" do
        @user.password = "sho11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "Passwordが埋まっててもpassword_confirmationが空では保存できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationは同じでないと保存できない" do
        @user.password_confirmation = "sho1999"
        @user.password_confirmation = "sho2000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では保存できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では保存できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaが空では保存できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaは半角英字のみでは登録できない" do
        @user.last_name_kana = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
      end
      it "last_name_kanaは半角数字のみでは登録できない" do
        @user.last_name_kana = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
      end
      it "last_name_kanaは漢字のみでは登録できない" do
        @user.last_name_kana = "昇翔"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
      end
      it "first_name_kanaが空では保存できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは半角英字のみでは登録できない" do
        @user.first_name_kana = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
      it "first_name_kanaは半角数字のみでは登録できない" do
        @user.first_name_kana = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
      it "first_name_kanaは漢字のみでは登録できない" do
        @user.first_name_kana = "昇翔"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
      it "birthdateが空では保存できない" do
        @user.birthdate = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end

