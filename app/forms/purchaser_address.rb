class PurchaserAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number

  validates :post_code, :prefecture, :city, :house_number, :phone_number, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'には半角数字で１１桁以内入力して下さい'} 

  def save
    purchaser = Purchaser.create(user_id: current_user.id, product_id: params[:product_id])
    Address.create(post_code: post_code, city: city, house_number: house_number, building: building, phone_number: phone_number, purchaser_id: purchaser.id)
  end
end

