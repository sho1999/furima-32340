class UserPurchase

  include ActiveModel::Model
  attr_accessor :postcode, :region_id, :city, :block, :building, :phone_num, :item_id, :user_id, :token

  with_options presence: true do
    VALID_POSTAL_CODE =/\A\d{3}[-]\d{4}\z/
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :postcode,   format: { with: VALID_POSTAL_CODE, message: "はハイフンあり7桁で入力して下さい"}
    validates :region_id
    validates :city
    validates :block
    validates :phone_num,  format: { with: VALID_PHONE_REGEX, message: "はハイフンなし11桁以内で入力して下さい"}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, region_id: region_id, city: city, block: block, building: building, phone_num: phone_num, purchase_id: purchase.id)
  end
end