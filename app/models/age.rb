class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '0歳' }, { id: 3, name: '1歳' },
    { id: 4, name: '2歳' }, { id: 5, name: '3歳' }, { id: 6, name: '4歳' },
    { id: 7, name: '5歳' }, { id: 8, name: '6歳' }, { id: 9, name: '7歳' },
    { id: 10, name: '8歳' }, { id: 11, name: '9歳' }, { id: 12, name: '10歳' },
    { id: 13, name: '11歳' }, { id: 14, name: '12歳' }, { id: 15, name: '13歳' },
    { id: 16, name: '14歳' }, { id: 17, name: '15歳' }, { id: 18, name: '16歳' },
    { id: 19, name: '17歳' }, { id: 20, name: '18歳' }, { id: 21, name: '19歳' },
    { id: 22, name: '20歳' }, { id: 23, name: '21歳' }, { id: 24, name: '22歳' },
    { id: 25, name: '23歳' }, { id: 26, name: '24歳' }, { id: 27, name: '25歳' },
    { id: 28, name: '26歳' }, { id: 29, name: '27歳' }, { id: 30, name: '28歳' },
    { id: 31, name: '29歳' }, { id: 32, name: '30歳' }, { id: 33, name: '31歳' },
    { id: 34, name: '32歳' }, { id: 35, name: '33歳' }, { id: 36, name: '34歳' },
    { id: 37, name: '35歳' }, { id: 38, name: '36歳' }, { id: 39, name: '37歳' },
    { id: 40, name: '38歳' }, { id: 41, name: '39歳' }, { id: 42, name: '40歳' },
    { id: 43, name: '41歳' }, { id: 44, name: '42歳' }, { id: 45, name: '43歳' },
    { id: 46, name: '44歳' }, { id: 47, name: '44歳' }, { id: 48, name: '45歳' },
    { id: 49, name: '46歳' }, { id: 50, name: '47歳' }, { id: 51, name: '48歳' },
    { id: 52, name: '49歳' }, { id: 53, name: '50歳' }
  ]

  include ActiveHash::Associations
  has_many :records
end
