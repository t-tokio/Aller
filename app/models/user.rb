class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :existence

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数を両方含む必要があります' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナ文字を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :sex_id, numericality: { other_than: 1, message: '性別欄を選択してください' }
  validates :existence_id, numericality: { other_than: 1, message: '食物アレルギーの有無を選択してください' }
end
