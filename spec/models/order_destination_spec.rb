require 'rails_helper'

describe OrderDestination do 
  before do
    @order_destination = FactoryBot.build(:order_destination)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
      end
      it 'building_nameがからでも保存できること' do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_destination.postal_code = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できないこと' do
        @order_destination.postal_code = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid")
       end
      it 'prefecture_idが空だと保存できないこと' do
        @order_destination.prefecture_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_destination.municipality = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_destination.address = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
        it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10,11桁の数字以外だと保存できないこと' do
        @order_destination.phone_number = "123456789abcd"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空だと保存できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


