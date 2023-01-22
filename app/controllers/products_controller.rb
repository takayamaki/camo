# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: ProductViewModel.from_products(products)
  end
end
