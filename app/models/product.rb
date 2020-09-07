class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day
  
  belongs_to :user
  has_one_attached :image
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :products_condition_id
    validates :shipping_id
    validates :delivery_fee_id
    validates :delivery_day_id
  end
  validates :price,
    numericality: {
      greater_than_or_equal_to: 300, 
      less_than: 9999999 
    }
    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates_format_of :price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'
end
