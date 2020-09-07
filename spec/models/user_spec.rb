require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、family_name、first_name、family_name_cana、first_name_cana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "family_name、first_nameが全角かな/カナ/漢字であれば登録できる" do
        @user.family_name = "ミや本"
        @user.first_name = "ひロ勝"
        expect(@user).to be_valid
      end
      it "family_name_cana、first_name_canaが全角カタカナであれば登録できる" do
        @user.family_name_cana = "ミヤモト"
        @user.first_name_cana = "カツヒロ"
        expect(@user).to be_valid
      end
      it "passwordが英数字6文字以上であれば登録できる" do
        @user.password = "0000ai"
        @user.password_confirmation = "0000ai"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailには@が含まれていない場合は登録できない" do
        @user.email = "ddjkao1234.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "123ai"
        @user.password_confirmation = "123ai"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end 
      it "パスワードには英数字が混在していない場合に登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "0000ai"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "数字のみで６文字以上入力した場合登録できない" do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが英数字だと登録できない" do
        @user.family_name = "dio12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字かな/カナ/漢字を使用してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが英数字だと登録できない" do
        @user.first_name = "123do"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字かな/カナ/漢字を使用してください")
      end
      it "family_name_canaが空では登録できない" do
        @user.family_name_cana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name cana can't be blank")
      end
      it "family_name_canaがカタカナ以外では登録できない" do
        @user.family_name_cana = "12愛no"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name cana 全角カタカナのみ入力して下さい")
      end
      it "first_name_cana空では登録できない" do
        @user.first_name_cana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name cana can't be blank")
      end
      it "first_name_canaがカタカナ以外では登録できない" do
        @user.first_name_cana = "12酢dai"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name cana 全角カタカナのみ入力して下さい")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
