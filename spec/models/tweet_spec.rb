require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイート投稿' do
    context 'ツイートが投稿できる場合' do
      it '全ての項目を入力すればツイートできる' do
        expect(@tweet).to be_valid
      end
    end

    context 'ツイートができない場合' do
      it 'titleが空では出品できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空では出品できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end

      it 'imageが空では出品できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
