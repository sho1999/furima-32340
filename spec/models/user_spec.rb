require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'When you can register a new account' do
      it 'is valid with a nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthday' do
        expect(@user).to be_valid
      end
      it 'password,password_confirmationは7文字以上であれば登録できる' do
        @user.password = 'sho1234'
        @user.password_confirmation = 'sho1234'
        expect(@user).to be_valid
      end
    end
    context 'When new registration fails' do
      it 'is invalid without a nickname' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'is invalid without a email' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'is invalid without a password' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'is invalid without a password_confirmation although with a password' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'is invalid without a last_name' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'is invalid without a first_name' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'is invalid without a last_name_kana' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'is invalid without a first_name_kana' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'is invalid without a birthday' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'sho123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailの@の前に英数字がないと登録できない' do
        @user.email = '@sho.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailの@の後ろに英数字がないと登録できない' do
        @user.email = 'sho@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordは6文字以上でないと登録できない' do
        @user.password = 'sho12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'shosho'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '123123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it 'passwordは全角英数字だと登録できない' do
        @user.password = '１２３ｇｇｇｇ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it 'first_nameは全角でないと登録できない' do
        @user.first_name = 'ｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力して下さい")
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'ｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角で入力して下さい")
      end
      it 'first_name_kanaはカタカナでないと登録できない' do
        @user.first_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナのみで入力して下さい")
      end
      it 'last_name_kanaはカタカナでないと登録できない' do
        @user.last_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角カタカナのみで入力して下さい")
      end
    end
  end
end