require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe '食事記録' do
    context '食事記録ができる場合' do
      it '全ての項目を入力すれば記録できる' do
        expect(@record).to be_valid
      end
    end

    context '食事記録ができない場合' do
      it 'datetimeが空では出品できない' do
        @record.datetime = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Datetime can't be blank")
      end

      it 'ageが空では出品できない' do
        @record.age_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Age 年齢を選択してください")
      end

      it 'foodが空では出品できない' do
        @record.food = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Food can't be blank")
      end

      it 'stateが空では出品できない' do
        @record.state_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("State 食物アレルギーの有無を選択してください")
      end

      it 'userが紐付いていないと保存できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('User must exist')
      end
    end
  end
end
