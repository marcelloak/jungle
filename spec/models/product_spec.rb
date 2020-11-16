require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'creates if all validations are met' do
      @category = Category.create(name: 'category')
      @product = Product.create!(name: 'product', price: '1', quantity: '1', category_id: @category.id)
    end

    it 'fails if name validation is not met' do
      @category = Category.create(name: 'category')
      @product = Product.create(price: '1', quantity: '1', category_id: @category.id)
      expect(@product.errors.full_messages).to be_include("Name can't be blank")
    end

    it 'fails if price validation is not met' do
      @category = Category.create(name: 'category')
      @product = Product.create(name: 'product', quantity: '1', category_id: @category.id)
      expect(@product.errors.full_messages).to be_include("Price can't be blank")
    end

    it 'fails if quantity validation is not met' do
      @category = Category.create(name: 'category')
      @product = Product.create(name: 'product', price: '1', category_id: @category.id)
      expect(@product.errors.full_messages).to be_include("Quantity can't be blank")
    end

    it 'fails if category validation is not met' do
      @product = Product.create(name: 'product', price: '1', quantity: '1')
      expect(@product.errors.full_messages).to be_include("Category can't be blank")
    end
  end
end
