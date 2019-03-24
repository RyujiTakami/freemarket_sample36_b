require 'rails_helper'
describe User do
  describe '#create' do
    # nicknameが空では登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # emailが空では登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できない
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordが存在してもpassword_confirmationが空では登録できない
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # nicknameが21文字以上であれば登録できない
    it "is invalid with a nickname that has more than 21 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end

    # 重複したemailが存在する場合登録できない
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが5文字以下であれば登録できない
    it "is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "00000",password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

    # nickname・email・password・password_confirmationが存在すれば登録できる
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
