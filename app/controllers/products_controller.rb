class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_admin!, except: [:show]

  def index
    @products = current_admin.products
  end

  def new
    @product = current_admin.products.build
  end

  def show

  end

  def create
    @product = current_admin.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Saved..."
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Updated..."
    else
      render :edit
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_type, :category, :size, :product_name, :description, :stock, :price, :code_id, :active)
  end

end
