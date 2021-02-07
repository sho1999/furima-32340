class RegionId < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  validates :title, :text, presence: true
  validates :region_id, numericality: { other_than: 0 } 
end
