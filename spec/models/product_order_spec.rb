require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  
  before do
    @product_order = FactoryBot.build(:product_order)
  end

  describe '購入者情報の保存'  do
    context '商品購入出来るとき' do
      it '全ての項目が正しく入力されていれば購入出来る' do
        expect(@product_order).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it '郵便番号が空だと購入出来ない' do
        @product_order.postal_code = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it '郵便番号にハイフンが無ければ購入出来ない' do
        @product_order.postal_code = '1340081'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it '郵便番号が８桁で無ければ登録が出来ない' do
        @product_order.postal_code = '134-008'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'delivery_prefectures_idが空だと登録出来ない' do
        @product_order.delivery_prefecture_id = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'cityが空だと登録出来ない' do
        @product_order.city = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'address1が空だと登録出来ない' do
        @product_order.address1 = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'phone_numberが空だと登録が出来ない' do
        @product_order.phone_number = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'phone_numberが11桁出なければ登録が出来ない' do
        @product_order.phone_number = '090428356241'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end
    end
  end
end