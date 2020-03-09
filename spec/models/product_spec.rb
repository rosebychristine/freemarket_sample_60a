require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
      # product = Product.new(id: 1,name: "",price: 100,description: "この曲",condition: "悪い",fee_burden: "負担",shipping_time: "aa",prefectures: "大阪",user_id: 1)
      # product.valid?
      # expect(product.errors[:name]).to include("can't be blank")
    end
  end
end