class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   with_options presence: true do
      validates :nickname
      validates :birthday
      validates :family_name
      validates :first_name
      validates :family_name_cana
      validates :first_name_cana
   end
      
      NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/.freeze
      validates_format_of :family_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'
      validates_format_of :first_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'
    
      NAME_CANA_REGEX = /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/.freeze
      validates_format_of :family_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'
      validates_format_of :first_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'
      
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

      has_many :products
   
end
