require 'rails_helper'
  
describe Image do
  describe '#update' do

    it "商品画像がない場合は登録できないこと" do
      image = build(:image, picture: "")
      image.valid?
      expect(image.errors[:picture]).to include("を入力してください")
    end

  end
end