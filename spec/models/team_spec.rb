require 'rails_helper'

describe Team do
  describe '#create' do
    it "全て入力したら登録出来ること" do
      team = FactoryBot.build(:team)
      expect(team).to be_valid
    end

    it "nameが無いと登録できないこと" do
      team = FactoryBot.build(:team, name:"")
      team.valid?
      expect(team.errors[:name]).to include('を入力してください')
    end

    it "nameが大文字だと登録できないこと" do
      team = FactoryBot.build(:team, name:"AAA")
      team.valid?
      expect(team.errors[:name]).to include('は不正な値です')
    end

    it "nameが日本語だと登録できないこと" do
      team = FactoryBot.build(:team, name:"あああ")
      team.valid?
      expect(team.errors[:name]).to include('は不正な値です')
    end

    it "homeが無いと登録できないこと" do
      team = FactoryBot.build(:team, home:"")
      team.valid?
      expect(team.errors[:home]).to include('を入力してください')
    end

    it "homeが大文字だと登録できないこと" do
      team = FactoryBot.build(:team, home:"AAA")
      team.valid?
      expect(team.errors[:home]).to include('は不正な値です')
    end

    it "homeが日本語だと登録できないこと" do
      team = FactoryBot.build(:team, home:"あああ")
      team.valid?
      expect(team.errors[:home]).to include('は不正な値です')
    end

    it "stadiumが無いと登録できないこと" do
      team = FactoryBot.build(:team, stadium:"")
      team.valid?
      expect(team.errors[:stadium]).to include('を入力してください')
    end

    it "founding_yearが無いと登録できないこと" do
      team = FactoryBot.build(:team, founding_year:"")
      team.valid?
      expect(team.errors[:founding_year]).to include('を入力してください')
    end

    it "image_idが無いと登録できないこと" do
      team = FactoryBot.build(:team, image_id:"")
      team.valid?
      expect(team.errors[:image_id]).to include('を入力してください')
    end

  end
end