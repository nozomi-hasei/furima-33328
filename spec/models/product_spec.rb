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
      it 'priceが300以下だと登録出来ない' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it 'priceが9999999より大きいと登録出来ない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceは半角数字以外は登録出来ない' do
        @product.price = '１２３４５'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'imageが空では登録出来ない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'idが1を選択された場合登録出来ない' do
        @product.category_id = '1'
        @product.condition_id = '1'
        @product.delivery_cost_id = '1'
        @product.delivery_prefecture_id = '1'
        @product.delivery_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1", "Condition must be other than 1", "Delivery cost must be other than 1", "Delivery prefecture must be other than 1", "Delivery day must be other than 1")
      end
    end
  end
end

