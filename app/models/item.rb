class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    VALID_PRICE_REGEX =/\A[0-9]*\z/
    
    validates :name
    validates :description
    validates :price,
              numericality: { greater_than: 299, less_than: 10000000 },
              format: { with: VALID_PRICE_REGEX, message: "は半角数字で入力して下さい"}
    validates :image, unless: :was_attached?
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :shipping_date_id
    end
    validates :region_id, numericality: { other_than: 0 } 
  end


  def was_attached?
    self.image.attached?
  end


  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :region
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
