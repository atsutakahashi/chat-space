require 'rails_helper'

RSpec.describe Message, type: :model do
    describe '#message-create' do
      # メッセージがあれば保存できる
      it "is valid with body" do
       expect(build(:message, image: nil)).to be_valid
      end
      # 画像があれば保存できる
      it "is valid with image" do
       expect(build(:message, body: nil)).to be_valid
      end
      # メッセージと画像があれば保存できる
      it "is valid with body,image" do
       expect(build(:message)).to be_valid
      end
    end
    describe '#message-not-create' do
      # メッセージも画像も無いと保存できない
      it "is invalid without body, image" do
       message = build(:message, image: nil, body: nil)
       message.valid?
       expect(message.errors[:body]).to include("を入力してください")
      end
      # group_idが無いと保存できない
      it "is invalid without group_id" do
       message = build(:message, group_id: nil)
       message.valid?
       expect(message.errors[:group]).to include("を入力してください")
      end
      # user_idが無いと保存できない
      it "is invalid without user_id" do
       message = build(:message, user_id: nil)
       message.valid?
       expect(message.errors[:user]).to include("を入力してください")
      end
    end
end