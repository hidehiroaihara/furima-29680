class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   with_options presence: true do
      validates :nickname
      validates :birthday

      with_options format: { with: /\A[ぁ-んァ-ンー-龥]+\z/, message: '全角文字かな/カナ/漢字を使用してください' } do
        validates :family_name
        validates :first_name
      end
  
     with_options format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみ入力して下さい' } do
       validates :family_name_cana
       validates :first_name_cana
     end
  end
end
