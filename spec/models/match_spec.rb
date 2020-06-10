require 'rails_helper'

describe Match do
  describe '#create' do
    it "nameとstart_timeがあれば登録出来ること" do
      match = FactoryBot.build(:match)
      expect(match).to be_valid
    end

    it "nameが無いと登録できないこと" do
      match = FactoryBot.build(:match, name: "")
      match.valid?
      expect(match.errors[:name]).to include("を入力してください")
    end

    it "start_timeが無いと登録できないこと" do
      match = FactoryBot.build(:match, start_time: "")
      match.valid?
      expect(match.errors[:start_time]).to include("を入力してください")
    end
  end
end