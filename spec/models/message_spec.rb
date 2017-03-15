require 'rails_helper'

describe Message do
  describe "#create" do
    it "is invalid without a body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end

    it "is valid with a body" do
      user = create(:user)
      group = create(:group)
      message = build(:message, user: user, group: group)
      message.valid?
      expect(message).to be_valid
    end
  end
end