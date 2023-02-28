# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  it '商品の登録が一つもないとき、OKで空配列が返る' do
    get('/products')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true)).to be_empty
    end
  end

  it '商品の登録が一つのとき、OKでその商品が入った配列が返る' do
    product = Product.create!(name: 'バナナ')
    get('/products')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          [{
            id: product.id,
            name: product.name,
            created_at: product.created_at.rfc3339,
            updated_at: product.updated_at.rfc3339,
          }]
        )
    end
  end

  it '商品の登録が二つのとき、OKでそれら商品が入った配列が返る' do
    products = [
      Product.create!(name: 'バナナ'),
      Product.create!(name: 'キウイ'),
    ]
    get('/products')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          products.map do |product|
            {
              id: product.id,
              name: product.name,
              created_at: product.created_at.rfc3339,
              updated_at: product.updated_at.rfc3339,
            }
          end
        )
    end
  end
end
