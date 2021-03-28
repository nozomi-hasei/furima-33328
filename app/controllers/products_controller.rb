class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid? 
      @product.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def update
    if current_user.id == @product.user_id
      if @product.update(product_params)
        redirect_to product_path(@product)
      else
        render :edit
      end
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :condition_id, :delivery_cost_id, :delivery_prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end