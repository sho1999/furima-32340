class ShippingDateId < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shippingdate

  validates :title, :text, presence: true
  validates :shippingdate, numericality: { other_than: 1 } 
end
