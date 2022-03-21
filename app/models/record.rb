class Record < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :unit
  belongs_to :state

  validates :datetime, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  validates :food, presence: true


  # ジャンルの選択が「--」の時は保存できないようにする
  validates :age_id, numericality: { other_than: 1, message: '年齢を選択してください' }
  validates :state_id, numericality: { other_than: 1, message: '食物アレルギーの有無を選択してください' }
end
