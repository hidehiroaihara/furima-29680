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
        it "出品画像が存在する時登録できる" do
          @product.image = fixture_file_upload('public/images/test_image.png') 
          expect(@product).to be_valid
        end
        it "商品名が存在する時登録できる" do
           @product.name = "可愛いわんちゃん"
           expect(@product).to be_valid
        end
        it "商品の説明が存在する時登録できる" do
          @product.content = "いつも外で遊んでます"
          expect(@product).to be_valid
        end
        it "カテゴリーが存在する時登録できる" do
          @product.category_id = 5
          expect(@product).to be_valid
        end
        it "商品の状態が存在する時登録できる" do
          @product.products_condition_id = 3
          expect(@product).to be_valid
        end
        it "配送料の負担が存在する時登録できる" do
          @product.delivery_fee_id = 2
          expect(@product).to be_valid
        end
        it "発送元の地域が存在する時登録できる" do
          @product.shipping_id = 3
          expect(@product).to be_valid
        end
        it "発送までの日数が存在する時登録できる" do
          @product.delivery_day_id = 2
          expect(@product).to be_valid
        end
        it "販売価格が300~9999999の間であれば登録できる" do
          @product.price = "3948595"
          expect(@product).to be_valid
        end
        it "販売価格が半角数字であれば登録できる" do
          @product.price = 23345
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
        it "出品画像空では登録できない" do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
      end
  
end

