require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "name,price,describe,user_id,category_id,condition_id,shipping_cost_payer_id,prefecture_id,shipping_day_id,imageが存在すること" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "image が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "name が空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "price が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price が半角英数以外だと登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price outside the limits(¥300~¥9,999,999)")
      end
      it "price が300未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price outside the limits(¥300~¥9,999,999)")
      end
      it "price が10,000,000以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price outside the limits(¥300~¥9,999,999)")
      end
      it "describe が空だと登録できない" do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it "category_id が空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_id が 1 だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_id が空だと登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_id が 1 だと登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "shipping_cost_payer_id が空だと登録できない" do
        @item.shipping_cost_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost payer can't be blank")
      end
      it "shipping_cost_payer_id が 1 だと登録できない" do
        @item.shipping_cost_payer_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost payer must be other than 1")
      end
      it "prefecture_id が空だと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_id が 1 だと登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipping_day_id が空だと登録できない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it "shipping_day_id が 1 だと登録できない" do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end
      it "user が紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
