# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  it 'validなパラメータが指定されたとき、OKで商品が更新され、その商品の情報が返る' do
    product = Product.create!(name: 'バナナ')

    params = {
      name: 'キウイ',
    }
    patch("/products/#{product.id}", params:)
    product.reload

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(product.name).to eq(params[:name])
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: product.id,
          name: product.name,
          created_at: product.created_at.rfc3339,
          updated_at: product.updated_at.rfc3339
        )
    end
  end

  it 'invalidなパラメータが指定されたとき、422 Unprocessible Entityでエラー内容が返る' do
    product = Product.create!(name: 'バナナ')

    params = {
      name: '',
    }
    patch("/products/#{product.id}", params:)

    aggregate_failures do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          errors: match_array("Name can't be blank")
        )
    end
  end
end
