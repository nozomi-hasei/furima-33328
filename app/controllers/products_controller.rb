class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition, :delivery_cost_id, :delivery_prefectures_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end