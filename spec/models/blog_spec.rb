require 'rails_helper'

describe Blog do
  describe '#create' do
    it "titleとtextがあれば登録出来ること" do
      user = FactoryBot.create(:user)
      blog = FactoryBot.build(:blog, user_id: user[:id])
      expect(blog).to be_valid
    end

    it "titleが無い場合は登録できないこと" do
      user = FactoryBot.create(:user)
      blog = FactoryBot.build(:blog, user_id: user[:id], title: "")
      blog.valid?
      expect(blog.errors[:title]).to include("を入力してください")
    end

    it "textが無い場合は登録できないこと" do
      user = FactoryBot.create(:user)
      blog = FactoryBot.build(:blog, user_id: user[:id], text: "")
      blog.valid?
      expect(blog.errors[:text]).to include("を入力してください")
    end
  end
end