require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "nickname、email、password、password_confirmation、first_name、first_name_katakana、family_name、family_name_katakana、birthdayが存在する" do
        expect(@user).to be_valid
      end
      it "emailは、@が含まれること" do
        @user.email = "123@gmail.com"
        expect(@user).to be_valid
      end
      it "passwordは ６文字以上 かつ 英数字混合であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationの値は 一致すること" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      it "first_nameは、全角 であること" do
        @user.first_name = "佐藤"
        expect(@user).to be_valid
      end
      it "first_name_katakanaは、全角カタカナであること" do
        @user.first_name_katakana = "スズキ"
        expect(@user).to be_valid
      end
      it "family_nameは、全角 であること" do
        @user.family_name = "太郎"
        expect(@user).to be_valid
      end
      it "family_name_katanakaは、全角カタカナであること" do
        @user.family_name_katakana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは、@が含まれないと登録できない" do
        @user.email = "123gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字以下では登録できない" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英字だけでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在しても password_confirmationが空では登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_name_katakanaが空だと登録できない" do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "first_name_katakanaが全角カナ以外だと登録できない" do
        @user.first_name_katakana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.family_name = "sato"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "family_name_katakanaが空だと登録できない" do
        @user.family_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end
      it "family_name_katakanaが全角カタカナ以外だと登録できない" do
        @user.family_name_katakana = "さとう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
