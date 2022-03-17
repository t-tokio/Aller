class Existence < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食物アレルギー有り' },
    { id: 3, name: '食物アレルギー無し' }
  ]

  include ActiveHash::Associations
  has_many :users
end
