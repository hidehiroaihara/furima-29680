require 'rails_helper'
describe PurchaserAddress, type: :model do
  describe '購入機能の住所保存' do
    before do
      @purchaser_address = FactoryBot.build(:purchaser_address)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@purchaser_address).to be_valid
    end
    it 'post_codeが空では保存できない' do
      @purchaser_address.post_code = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchaser_address.post_code = '2335677'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include( "Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idは選択していないと保存できない' do
      @purchaser_address.prefecture_id = 1
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では保存できない' do
      @purchaser_address.city = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では保存できない' do
      @purchaser_address.house_number = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空では保存できない' do
      @purchaser_address.phone_number = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @purchaser_address.phone_number = '３４５６７８６２３４'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number にはハイフン無しの半角数字で１１桁以内入力して下さい")
    end
    it 'phone_numberがハイフンがあると保存できない' do
      @purchaser_address.phone_number = '090-2345-9899'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number にはハイフン無しの半角数字で１１桁以内入力して下さい")
    end
    it 'phone_numberが11桁以内でないと保存できない' do
      @purchaser_address.phone_number = '1234567890123'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number にはハイフン無しの半角数字で１１桁以内入力して下さい")
    end
    it 'buildingが空でも保存できる' do
      @purchaser_address.building = nil
      @purchaser_address.valid?
      expect(@purchaser_address).to be_valid
    end
  end
end