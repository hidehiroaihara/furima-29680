class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building, :phone_number

  validates :post_code, :prefecture, :city, :house_number, :phone_number, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  PHONE_REGEX = ^0\d{9,10}$.freeze
  validates :phone_number, with: PJONE_REGEX, message: 'には半角数字で１１桁以内入力して下さい'

  def save
    user = User.create
    product = Product.create
    purchaser = Purchaser.create(user_id: user.id, product_id: product.id)
    Address.create(post_code: post_code, city: city, house_number: house_number, building: building, phone_number: phone_number, purchaser_id: purchaser_id)
  end

