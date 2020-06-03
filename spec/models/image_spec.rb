require 'rails_helper'
  
describe Image do
  describe '#create' do

    It "商品画像がない場合は登録できないこと" do
      image = build(:image, picture: "")
      image.valid?
      expect(image.errors[:picture]).to include("を1枚~10枚アップロードしてください")
    end

    It "商品画像が10枚以上の場合は登録できない" do
      image = build(:image, picture: "")
      image.valid?
      expect(image.errors[:picture]).to include("を1枚~10枚アップロードしてください")
    end

  end
end