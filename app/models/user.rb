class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ヶー－々]+\z/, message: 'には全角文字（漢字・ひらがな・カタカナ）を入力してください' }
  validates :first_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ヶー－々]+\z/, message: 'には全角文字（漢字・ひらがな・カタカナ）を入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カタカナを入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カタカナを入力してください' }
  validates :birthday, presence: true

  validates :password, format: { with:  /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'には英字と数字の両方を含めて設定してください' }

  has_many :items
  has_many :orders
end
