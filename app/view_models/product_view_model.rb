# frozen_string_literal: true

class ProductViewModel
  class << self
    def from_products(products)
      products.map { |product| new(product) }
    end
  end

  attr_reader :product

  def initialize(product)
    @product = product
  end

  def to_hash
    {
      id: product.id,
      name: product.name,
      created_at: product.created_at.rfc3339,
      updated_at: product.updated_at.rfc3339,
    }
  end
end
