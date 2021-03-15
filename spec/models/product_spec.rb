require 'rails_helper'

describe Product, type: :model do

  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '出品登録が出来るとき' do
      it '全ての項目が正しく入力されていれば出品登録が出来る' do
        expect(@product).to be_valid
      end
    end

    context '出品登録が出来ないとき' do
      it 'product_nameが空だと登録出来ない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空だと登録が出来ない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録出来ない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと登録できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_cost_idが空だと登録出来ない' do
        @product.delivery_cost_id =''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost can't be blank")
      end
      it 'delivery_prefectures_idが空だと登録出来ない' do
        @product.delivery_prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery prefecture can't be blank")
      end
      it 'delivery_day_idが空だと登録出来ない' do
        @product.delivery_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空だと登録出来ない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

