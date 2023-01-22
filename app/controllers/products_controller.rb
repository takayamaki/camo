# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: ProductViewModel.from_products(products)
  end

  def show
    product = Product.find(params[:id])

    render json: ProductViewModel.from_product(product)
  end

  def create
    product = Product.create!(params.permit(:name))

    render json: ProductViewModel.from_product(product)
  end

  def update
    product = Product.find(params[:id])
    product.update!(params.permit(:name))

    render json: ProductViewModel.from_product(product)
  end
end
