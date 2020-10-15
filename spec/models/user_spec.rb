require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "nickname、email、password、password_confirmation、first_name、first_name_katakana、family_name、family_name_katakana、birthdayが存在する" do
      end
      it "passwordは ６文字以上 かつ 英数字混合であれば登録できる" do
      end
      it "passwordとpassword_confirmationの値は 一致すること" do
      end
      it "first_nameは、全角 であること" do
      end
      it "first_name_katakanaは、全角カタカナであること" do
      end
      it "family_nameは、全角 であること" do
      end
      it "family_name_katanakaは、全角カタカナであること" do
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailでは登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが６文字以下では登録できない" do
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      end
      it "passwordが存在しても password_confirmationが空では登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameが全角でなければ登録できない" do
      end
      it "first_name_katakanaが空だと登録できない" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "family_name_katakanaが空だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
