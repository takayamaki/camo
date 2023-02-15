# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CustomersController do
  it '指定されたIDの入荷が存在するとき、OKでその入荷の情報が返る' do
    customer = Customer.create!(name: '顧客1')
    get("/customers/#{customer.id}")

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body, symbolize_names: true))
        .to match(
          id: customer.id,
          name: customer.name,
          created_at: customer.created_at.rfc3339,
          updated_at: customer.updated_at.rfc3339
        )
    end
  end

  it '指定されたIDの入荷が存在しないとき、Not Foundが返る' do
    get('/customers/1')

    aggregate_failures do
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body, symbolize_names: true)).to match(
        errors: [
          "No such Customer"
        ]
      )
    end
  end
end
