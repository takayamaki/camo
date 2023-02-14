# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController do
  it '顧客の登録が一つもないとき、OKで空配列が返る' do
    get('/customers')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to be_empty
    end
  end

  it '顧客の登録が一つのとき、OKでその顧客が入った配列が返る' do
    customer = Customer.create!(name: '顧客1')
    get('/customers')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          [{
            id: customer.id,
            name: customer.name,
            created_at: customer.created_at.rfc3339,
            updated_at: customer.updated_at.rfc3339,
          }]
        )
    end
  end

  it '顧客の登録が二つのとき、OKでそれら顧客が入った配列が返る' do
    customers = [
      Customer.create!(name: '顧客1'),
      Customer.create!(name: '顧客2'),
    ]
    get('/customers')

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          customers.map do |customer|
            {
              id: customer.id,
              name: customer.name,
              created_at: customer.created_at.rfc3339,
              updated_at: customer.updated_at.rfc3339,
            }
          end
        )
    end
  end
end
