class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :description
    validates :price
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
