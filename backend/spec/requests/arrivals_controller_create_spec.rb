# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArrivalsController do
  it 'validなパラメータが指定されたとき、OKで入荷が作成され、その入荷の情報が返る' do
    product = Product.create!(name: 'バナナ')
    params = {
      product_id: product.id,
      amount_in_cases: 1,
      arrived_at: Time.zone.now.rfc3339,
    }
    post('/arrivals', params:)
    arrival = Arrival.last

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(arrival.product_id).to eq(params[:product_id])
      expect(arrival.amount_in_cases).to eq(params[:amount_in_cases])
      expect(arrival.arrived_at.rfc3339).to eq(params[:arrived_at])
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: arrival.id,
          product_id: arrival.product_id,
          amount_in_cases: arrival.amount_in_cases,
          arrived_at: arrival.arrived_at.rfc3339,
          created_at: arrival.created_at.rfc3339,
          updated_at: arrival.updated_at.rfc3339
        )
    end
  end

  it 'invalidなパラメータが指定されたとき、422 Unprocessible Entityでエラー内容が返る' do
    product = Product.create!(name: 'バナナ')
    params = {
      product_id: product.id,
      amount_in_cases: 1.5,
      arrived_at: Time.zone.now.rfc3339,
    }
    post('/arrivals', params:)

    aggregate_failures do
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          errors: match_array('Amount in cases must be an integer')
        )
    end
  end
end
