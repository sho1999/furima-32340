class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_PASSWORD_REGEX =/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/
    VALID_USER_REGEX =/\A[一-龥]+\z/
    VALID_USER_REGEX_KANA =/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/

    validates :nickname
    validates :password,
              format: { with: VALID_PASSWORD_REGEX,
              message: "は半角英数字それぞれ１文字以上含む必要があります"}
    with_options format: { with: VALID_USER_REGEX,message: "漢字のみで入力して下さい"} do
      validates :last_name
      validates :first_nama
    end
    with_options format: { with: VALID_USER_REGEX_KANA,message: "全角カタカナのみで入力して下さい"} do
      validates :last_name_kana
      validates :first_nama_kana
    end
    validates :birthday
  end
  
  has_many :items
  has_many :purchases
end


