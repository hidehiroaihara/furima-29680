require 'rails_helper'
describe Product  do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('public/images/test_image.png')
    end
    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it "name、content、category_id、products_condition_id、shipping_id、delivery_fee_id、delivery_day_id、price、imageが存在すれば登録できる" do
          expect(@product).to be_valid
        end
      end
    end  
      context '商品出品がうまくいかないとき' do
        it "商品名が空だと登録できない" do
          @product.name = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が空では登録できない" do
          @product.content = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Content can't be blank")
        end
        it "カテゴリーが空では登録できない" do
          @product.category_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end
        it "カテゴリーのIDが1の場合登録できない" do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態が空では登録できない" do
          @product.products_condition_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Products condition can't be blank")
        end
        it "商品の状態のIDが1では登録できない" do
          @product.products_condition_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Products condition must be other than 1")
        end 
        it "配送料が負担が空では登録できない" do
          @product.delivery_fee_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it "配送料の負担はIDが1では登録できない"do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it "発送元の地域が空では登録できない" do
          @product.shipping_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping can't be blank")
        end
        it "配送元の地域のIDが1では登録できない" do
          @product.shipping_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipping must be other than 1")
        end
        it "発送までの日数が空では登録できない" do
          @product.delivery_day_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery day can't be blank")
        end
        it "発送までの日数のIDが1では登録できない" do
          @product.delivery_day_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery day must be other than 1")
        end
        it "販売価格が空で登録できない" do
          @product.price = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it "販売価格が半角数字以外だと登録できない" do
          @product.price = "お金"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end
        it "販売価格が300以下だと登録できない" do
          @product.price = 23
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "販売価格が10000000以上だと登録できない" do
          @product.price = 10000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than 9999999")

        end
        it "出品画像空では登録できない" do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
      end
  
end

