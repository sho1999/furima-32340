class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format:{with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

    VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{7,}\z/

    with_options format: { with: VALID_PASSWORD_REGEX } do
      validates :password, length: { minimum: 6 }
      validates :password_confirmation
    end

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

