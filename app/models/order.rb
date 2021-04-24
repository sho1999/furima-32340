class Order < ApplicationRecord
  with_options presence: true do
    validates :postcode
    validates :region_id
    validates :city
    validates :block
    validates :phone_num
    validates :purchase 
  end
  validates :building

  belongs_to :purchase
end
