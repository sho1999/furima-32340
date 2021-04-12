class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :region_id
    validates :shipping_date_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
