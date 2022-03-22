class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '異常なし' },
    { id: 3, name: '(弱)反応あり' },
    { id: 4, name: '反応あり' },
    { id: 5, name: '(強)反応あり' },
    { id: 6, name: '苦しい' }
  ]

  include ActiveHash::Associations
  has_many :records
end
