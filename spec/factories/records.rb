FactoryBot.define do
  factory :record do
    datetime { Faker::Date.backward }
    age_id { 25 }
    food { '卵' }
    state_id { 2 }

    association :user

  end
end
