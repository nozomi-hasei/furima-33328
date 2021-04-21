require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @product_order = FactoryBot.build(:product_order, product_id: @product.id, user_id: @user.id)
    sleep 0.1 # 0.1秒待機
  end

  describe '購入者情報の保存'  do
    context '商品購入出来るとき' do
      it '全ての項目が正しく入力されていれば購入出来る' do
        expect(@product_order).to be_valid
      end

      it 'address2が抜けていても登録出来ること' do
        @product_order.address2 = ''
        expect(@product_order).to be_valid
      end
    end

    context '商品購入が出来ないとき' do
      it 'token（クレジットカード情報）が空だと購入出来ない' do
        @product_order.token = nil
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入出来ない' do
        @product_order.postal_code = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid", "Postal code is the wrong length (should be 8 characters)")
      end

      it '郵便番号にハイフンが無ければ購入出来ない' do
        @product_order.postal_code = '1340081'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が８桁で無ければ登録が出来ない' do
        @product_order.postal_code = '134-008'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Postal code is invalid", "Postal code is the wrong length (should be 8 characters)")
      end

      it 'delivery_prefectures_idが空だと登録出来ない' do
        @product_order.delivery_prefecture_id = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Delivery prefecture can't be blank")
      end

      it 'delivery_prefectures_idが1では登録出来ない' do
        @product_order.delivery_prefecture_id = 1
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Delivery prefecture must be other than 1")
      end

      it 'cityが空だと登録出来ない' do
        @product_order.city = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("City can't be blank")
      end

      it 'address1が空だと登録出来ない' do
        @product_order.address1 = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Address1 can't be blank")
      end

      it 'phone_numberが空だと登録が出来ない' do
        @product_order.phone_number = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが11桁出なければ登録が出来ない' do
        @product_order.phone_number = '090428356241'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英数混合では登録が出来ない' do
        @product_order.phone_number = '090abcd5624'
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では登録出来ないこと' do
        @product_order.user_id = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end

      it 'product_idが空では登録出来ないこと' do
        @product_order.product_id = ''
        @product_order.valid?
        expect(@product_order.errors.full_messages).to include()
      end
    end
  end
end