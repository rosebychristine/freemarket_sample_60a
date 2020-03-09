require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with name, price" do
    product = Product.new(
      name: "加藤",
      price: "加藤？ 神"
      )
    expect(product).to be_valid
  end
end
