# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArrivalsController do
  it '存在する入荷のIDが指定されたとき、入荷が削除され、OKでその入荷の情報が返る' do
    product = Product.create!(name: 'バナナ')
    arrival = Arrival.create!(product:,
                              amount_in_cases: 1,
                              arrived_at: Time.zone.now)

    delete("/arrivals/#{arrival.id}")

    aggregate_failures do
      expect(response).to have_http_status(:ok)
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

  it '存在しない入荷のIDが指定されたとき、Not Foundが返る' do
    delete('/arrivals/1')

    aggregate_failures do
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body, symbolize_names: true)).to match(
        errors: [
          "No such Arrival"
        ]
      )
    end
  end
end
