class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{7,}\z/

  
  with_options presence: true do
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX}

    validates :nickname       
    validates :email          
    validates :encrypted_password

    with_options format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'は全角文字を使用してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' } do
      validates :last_name_kana 
      validates :first_name_kana
    end
    validates :birthdate
  end

  has_many :items
  has_many :item_users
  
end

