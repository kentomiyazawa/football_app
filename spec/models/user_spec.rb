require 'rails_helper'

describe User do
  describe '#create' do
    it "nameが無い場合は登録できないこと" do
      user = FactoryBot.build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it " 重複したnameが存在する場合は登録できないこと " do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("はすでに存在します")
    end

    it "emailが無い場合は登録できないこと" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが無い場合は登録できないこと" do
      user = FactoryBot.build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが5文字以下だと登録できないこと" do
      user = FactoryBot.build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it " passwordが6文字以上であれば登録できること " do
      user = FactoryBot.build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "profileが無くても登録できること" do
      user = FactoryBot.build(:user, profile: "")
      expect(user).to be_valid
    end
  end
end