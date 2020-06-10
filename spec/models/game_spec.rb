require 'rails_helper'

describe Game do
  describe '#create' do
    it "全て入力されていれば登録出来ること" do
      team = FactoryBot.create(:team)
      match = FactoryBot.create(:match)
      game = FactoryBot.build(:game, match_id: match[:id], home_team_id: team[:id], away_team_id: team[:id])
      expect(game).to be_valid
    end

  end
end