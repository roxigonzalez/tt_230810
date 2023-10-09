class ProductsController < ApplicationController

  def show
    # rendering json and xml
    product  = Product.find_by(id: params[:id])
    # responde 404 if product not found

    unless product 
      render json: { error: 'Product not found' }, status: :not_found and return
    end

    respond_to do |format|
      format.json { render json: product }
      format.xml { render xml: product }
    end
  end

  def index
    products = Product.all

    respond_to do |format|
      format.json { render json: products }
      format.xml { render xml: products }
    end
  end

  def create
    # call service to create product
    product = CreateProduct.call(product_params)
    if product 
      render json: { product: product }, status: :created
    else
      render json: { error: product.errors }, status: :unprocessable_entity
    end
  end

  def update
    # call service to update product
    product = UpdateProduct.call(Product.find(params[:id]), product_params)
    if product
      render json: { product: product }
    else
      render json: { error: product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    render json: { message: 'Product deleted' }
  end

  protected 
  # product params
  def product_params
    params.require(:product).permit(:name, :description, :vendor, :price, :currency, :stock, :image_url, :sku)
  end
end
