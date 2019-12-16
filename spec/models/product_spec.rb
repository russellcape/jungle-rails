require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should create new product if it passes all the validations' do
      @category = Category.create(name:"Sporting Goods")
      @product = Product.new(
        name: "Armada Invictus 89 Ti",
        price: 878.39,
        quantity: 24,
        :category => @category
        )
      @product.errors.full_messages
      expect(@product).to (be_valid)
    end

    it 'should not save new products without a valid name' do
      @category = Category.create(name:"Sporting Goods")
      @product = Product.new(
        name: nil,
        price: 878.39,
        quantity: 24,
        :category => @category
        )
      @product.errors.full_messages
      expect(@product).to_not (be_valid)
    end

    it "should not save new products without a price" do
      @category = Category.create(name:"Sporting Goods")
      @product = Product.new(
        name: "Armada Invictus 89 Ti",
        price: nil,
        quantity: 24,
        :category => @category
        )
      @product.errors.full_messages
      expect(@product).to_not (be_valid)
    end

    it 'should not save new products without a quantity' do
      @category = Category.create(name:"Sporting Goods")
      @product = Product.new(
        name: "Armada Invictus 89 Ti",
        price: 878.39,
        quantity: nil,
        :category => @category
        )
      @product.errors.full_messages
      expect(@product).to_not (be_valid)
    end

    it 'should not save new products without a valid category' do
      @category = Category.create(name:"Sporting Goods")
      @product = Product.new(
        name: "Armada Invictus 89 Ti",
        price: 878.39,
        quantity: 24,
        :category => nil
        )
      @product.errors.full_messages
      expect(@product).to_not (be_valid)
    end
    
  end
end
