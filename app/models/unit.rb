class Unit < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '個' },
    { id: 3, name: '口' },
    { id: 4, name: 'g' },
    { id: 5, name: 'ml' },
    { id: 6, name: 'さじ' },
    { id: 7, name: '人前' }
  ]

  include ActiveHash::Associations
  has_many :records
end