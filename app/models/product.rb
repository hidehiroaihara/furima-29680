class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :products_condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day
  belongs_to :user
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :products_condition_id
    validates :shipping_id
    validates :delivery_fee_id
    validates :delivery_day_id
  end
end
