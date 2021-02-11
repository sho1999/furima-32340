class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :name
    validates :text
    with_options numericality: { other_than: 1, message:"Select" } do
      validates :category_id
      validates :state_id
      validates :postage_id
      validates :shipping_date_id
    end
    validates :region_id, numericality: { other_than: 0, message: "Select" }
    validates :price, numericality: { less_than: 10000000, greater_than: 299, only_integer: true}, format: { with:/\A[0-9]+\z/}
    validates :image
  end

  has_one_attached :image
  belongs_to :user
  belongs_to :postage
  belongs_to :category
  belongs_to :region
  belongs_to :shipping_date
  belongs_to :state
end