class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{7,}\z/

  validates :password             , confirmation: true,
                                    presence: true,
                                    format: { with: VALID_PASSWORD_REGEX}

  validates :nickname             , presence: true
  validates :email                , presence: true
  validates :encrypted_password   , presence: true

  with_options presence: true     , format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  
  validates :last_name_kana       , presence: true
  validates :first_name_kana      , presence: true
  validates :birthdate            , presence: true

  has_many :items
  has_many :item_users
end

