# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArrivalsController do
  it '入荷の登録が一つもないとき、OKで空配列が返る' do
    get('/arrivals')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to be_empty
    end
  end

  it '入荷の登録が一つのとき、OKでその入荷が入った配列が返る' do
    product = Product.create!(name: 'バナナ')
    arrival = Arrival.create!(product:,
                              amount_in_cases: 1,
                              arrived_at: Time.zone.now)
    get('/arrivals')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          [{
            id: arrival.id,
            product_id: arrival.product_id,
            amount_in_cases: arrival.amount_in_cases,
            arrived_at: arrival.arrived_at.rfc3339,
            created_at: arrival.created_at.rfc3339,
            updated_at: arrival.updated_at.rfc3339,
          }]
        )
    end
  end

  it '入荷の登録が二つのとき、OKでそれら入荷が入った配列が返る' do
    product = Product.create!(name: 'バナナ')
    arrivals = [
      Arrival.create!(product:,
                      amount_in_cases: 1,
                      arrived_at: Time.zone.now),
      Arrival.create!(product:,
                      amount_in_cases: 2,
                      arrived_at: Time.zone.now),
    ]
    get('/arrivals')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          arrivals.map do |arrival|
            {
              id: arrival.id,
              product_id: arrival.product_id,
              amount_in_cases: arrival.amount_in_cases,
              arrived_at: arrival.arrived_at.rfc3339,
              created_at: arrival.created_at.rfc3339,
              updated_at: arrival.updated_at.rfc3339,
            }
          end
        )
    end
  end
end
