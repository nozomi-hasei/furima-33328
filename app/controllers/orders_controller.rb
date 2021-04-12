class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:index, :create]

  def index
    @product_order = ProductOrder.new
  end

  def create
    @product_order = ProductOrder.new(order_params)
    if @product_order.valid?
      @product_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:product_order).permit(:postal_code, :delivery_prefecture_id, :city, :address1, :address2, :phone_number).merge( product_id: params[:product_id], user_id: current_user.id)
  end

  def find_params
    @product = Product.find(params[:product_id])
  end
end
