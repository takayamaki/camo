# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  it '存在する商品のIDが指定されたとき、商品が削除され、OKでその商品の情報が返る' do
    product = Product.create!(name: 'バナナ')

    delete("/products/#{product.id}")

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

  it '存在しない商品のIDが指定されたとき、Not Foundが返る' do
    delete('/products/1')

    aggregate_failures do
      expect(response).to have_http_status(:not_found)
      expect(response.body).to eq('404 Not Found')
    end
  end

  it '存在する商品のIDが指定されたが、その商品に紐づく注文が存在するとき、商品が削除されず、422 Unprocessible Entityが返る' do
    product = Product.create!(name: 'バナナ')
    customer = Customer.create!(name: 'ミリオン商事')
    order = Order.create!(customer:, ordered_at: Time.zone.now)
    OrderItem.create!(order:, product:, amount_in_cases: 1)

    delete("/products/#{product.id}")

    aggregate_failures do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          errors: match_array('Cannot delete record because dependent order items exist')
        )
    end
  end
end
