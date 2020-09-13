class PurchaserAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :purchaser_id, :user_id, :product_id, :token

  with_options presence: true do
     validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'には半角数字で１１桁以内入力して下さい'} 
  end
  validates :city, :house_number, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchaser = Purchaser.create(user_id: user_id, product_id: product_id)
    Address.create(post_code: post_code, city: city, house_number: house_number, building: building, phone_number: phone_number,prefecture_id: prefecture_id, purchaser_id: purchaser.id)
  end
end

