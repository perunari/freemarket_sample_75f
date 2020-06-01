require 'rails_helper'
describe Address do
  describe '#create' do

    it "必須項目が全て存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "family_nameがない場合は登録できないこと" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
    end
    
    it "first_nameがない場合は登録できないこと" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      address = build(:address, family_name_kana: "")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "blockがない場合は登録できないこと" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end
    
    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it " family_nameが全角でない場合は登録できないこと" do
      address = build(:address, family_name: "kana")
      address.valid?
      expect(address.errors[:family_name]).to include("は不正な値です")
    end

    it " first_nameが全角でない場合は登録できないこと" do
      address = build(:address, first_name: "kana")
      address.valid?
      expect(address.errors[:first_name]).to include("は不正な値です")
    end

    it " family_name_kanaがひらがなで返ること" do
      address = build(:address, family_name_kana: "田中")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("は不正な値です")
    end

    it " first_name_kanaがひらがなで返ること" do
      address = build(:address, first_name_kana: "太郎")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("は不正な値です")
    end
  end
  
end