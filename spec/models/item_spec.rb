require 'rails_helper'
  
describe Item do
  describe '#create' do

    it "必須項目が全てないと登録できない" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end

    it "商品名がない場合は登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品名が４０文字以上場合は登録できないこと" do
      item = build(:item, name: "#{'あああああああああああ' * 11}")
      item.valid?
      expect(item.errors[:name]).to include("は最大で40字までです")
    end

    it "商品説明がない場合は登録できないこと" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "商品説明がない場合は登録できないことが1000文字以上場合は登録できないこと" do
      item = build(:item, description: "#{'あああああああああああ' * 100}")
      item.valid?
      expect(item.errors[:description]).to include("は最大で1000字までです")
    end

    it "ログインしてないと登録できないこと" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it "価格がない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "価格が２９９円以下の場合は登録できないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は¥300〜9,999,999の範囲で入力してください")
    end
    
    it "価格が10000000円以上の場合は登録できないこと" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は¥300〜9,999,999の範囲で入力してください")
    end
    
    it "カテゴリーを選択していない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を選択してください")
    end
    
    it "配送料の負担者を選択していない場合は登録できないこと" do
      item = build(:item, postage_payment_id: "")
      item.valid?
      expect(item.errors[:postage_payment_id]).to include("を選択してください")
    end
    
    it "発送元が選択されていない場合は登録できないこと" do
      item = build(:item, ship_from_id: "")
      item.valid?
      expect(item.errors[:ship_from_id]).to include("を選択してください")
    end
    
    it "発送までの日数が選択されてない場合は登録できないこと" do
      item = build(:item, preparation_id: "")
      item.valid?
      expect(item.errors[:preparation_id]).to include("を選択してください")
    end

    it "商品状態が選択されてない場合は登録できないこと" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を選択してください")
    end

    it "商品画像が10枚以上の場合は登録できない" do
      item = build(:item)
      item.images = build_list(:image, 11)
      item.valid?
      expect(item.errors[:images]).to include("を1枚~10枚アップロードしてください")
    end
    
  end
end