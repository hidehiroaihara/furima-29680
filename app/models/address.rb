class Address < ApplicationRecord
  belongs_to :purchaser
  belongs_to_active_hash :prefecture

end
