require 'rails_helper'

describe Player do
  describe '#create' do
    it "全て入力したら登録出来ること" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id])
      expect(player).to be_valid
    end

    it "nameが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], name: "")
      player.valid?
      expect(player.errors[:name]).to include("を入力してください")
    end

    it "nameが大文字だと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], name: "AAA")
      player.valid?
      expect(player.errors[:name]).to include("は不正な値です")
    end

    it "nameが日本語だと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], name: "あああ")
      player.valid?
      expect(player.errors[:name]).to include("は不正な値です")
    end

    it "positionが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], position: "")
      player.valid?
      expect(player.errors[:position]).to include("を入力してください")
    end

    it "footedが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], footed: "")
      player.valid?
      expect(player.errors[:footed]).to include("を入力してください")
    end

    it "heightが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], height: "")
      player.valid?
      expect(player.errors[:height]).to include("を入力してください")
    end

    it "weightが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], weight: "")
      player.valid?
      expect(player.errors[:weight]).to include("を入力してください")
    end

    it "nationallyが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], nationally: "")
      player.valid?
      expect(player.errors[:nationally]).to include("を入力してください")
    end

    it "nationallyが大文字だと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], nationally: "AAA")
      player.valid?
      expect(player.errors[:nationally]).to include("は不正な値です")
    end

    it "nationallyが日本語だと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], nationally: "あああ")
      player.valid?
      expect(player.errors[:nationally]).to include("は不正な値です")
    end

    it "birthdayが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], birthday: "")
      player.valid?
      expect(player.errors[:birthday]).to include("を入力してください")
    end

    it "uniform_numberが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: team[:id], uniform_number: "")
      player.valid?
      expect(player.errors[:uniform_number]).to include("を入力してください")
    end

    it "team_idが無いと登録できないこと" do
      team = FactoryBot.create(:team)
      player = FactoryBot.build(:player, team_id: nil )
      player.valid?
      expect(player.errors[:team_id]).to include("を入力してください")
    end


  end
end