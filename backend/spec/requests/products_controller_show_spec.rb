# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  it '指定されたIDの商品が存在するとき、OKでその商品の情報が返る' do
    product = Product.create!(name: 'バナナ')
    get("/products/#{product.id}")

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: product.id,
          name: product.name,
          created_at: product.created_at.rfc3339,
          updated_at: product.updated_at.rfc3339
        )
    end
  end

  it '指定されたIDの商品が存在しないとき、Not Foundが返る' do
    get('/products/1')

    aggregate_failures do
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body, symbolize_names: true)).to match(
        errors: [
          'No such Product',
        ]
      )
    end
  end
end
