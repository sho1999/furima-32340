class Order < ApplicationRecord
  with_options presence: true do
    VALID_POSTAL_CODE =/\A\d{3}[-]\d{4}\z/
    VALID_PHONE_NUM =/\A\d{11}\z/
    validates :postcode,   format: { with: VALID_POSTAL_CODE, message: "はハイフンあり7桁で入力して下さい"}
    validates :region_id
    validates :city
    validates :block
    validates :phone_num,  format: { with: VALID_PHONE_NUM, message: "はハイフンなし11桁で入力して下さい"}
    validates :purchase 
  end

  belongs_to :purchase
end

