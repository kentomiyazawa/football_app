require 'rails_helper'

describe Maneger do
  describe '#create' do
    it "全て入力したら登録出来ること" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id])
      expect(maneger).to be_valid
    end

    it "nationallyが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('を入力してください')
    end

    it "nationallyが小文字なら登録出来ること" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally: "aaa")
      expect(maneger).to be_valid
    end

    it "nationallyが大文字だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"AAA")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "nationallyが数字だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"111")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "nationallyが日本語だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"あああ")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "birthdayが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], birthday:"")
      maneger.valid?
      expect(maneger.errors[:birthday]).to include('を入力してください')
    end

    it "nationallyが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('を入力してください')
    end

    it "nationallyが小文字なら登録出来ること" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally: "aaa")
      expect(maneger).to be_valid
    end

    it "nationallyが大文字だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"AAA")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "nationallyが数字だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"111")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "nationallyが日本語だと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: team[:id], nationally:"あああ")
      maneger.valid?
      expect(maneger.errors[:nationally]).to include('は不正な値です')
    end

    it "team_idが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      maneger = FactoryBot.build(:maneger, team_id: nil)
      maneger.valid?
      expect(maneger.errors[:team_id]).to include('を入力してください')
    end

  end
end